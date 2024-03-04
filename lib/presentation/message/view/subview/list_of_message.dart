import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/datahelpers/params/message/message_params.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/presentation/message/business/bloc/message/message_action_bloc.dart';
import 'package:climbapp/presentation/message/business/cubit/checkbox/message_checkbox_cubit.dart';
import 'package:climbapp/presentation/message/business/cubit/delete/message_delete_cubit.dart';
import 'package:climbapp/presentation/message/business/cubit/view/message_view_cubit.dart';
import 'package:climbapp/presentation/message/business/logic/message_logic.dart';
import 'package:climbapp/presentation/message/widgets/checkbox.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/widgets/user_view_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';

bool isChecked = true;
ScrollController _pageController = ScrollController();
ScrollController _listController = ScrollController();

class ListOfMessage extends StatelessWidget {
  final String direction;
  const ListOfMessage({required this.direction, super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => userLocator<MessageActionBloc>()
              ..add(LoadUserMessagesEvent(
                  params: GetMessageParams(
                      direction: direction,
                      url: AppUrl.getUserMessages(user.id)))),
          ),
          BlocProvider(create: (context) => userLocator<MessageDeleteCubit>())
        ],
        child: SingleChildScrollView(
          controller: _pageController,
          child: BlocBuilder<MessageActionBloc, MessageActionState>(
            builder: (context, state) {
              print(state.messages.length);
              BlocProvider.of<MessageCheckboxCubit>(context).addItemsToMap(
                  MessageLogic.boolCreator(state.messages.length));
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('ACTION'),
                      BlocBuilder<MessageDeleteCubit, MessageDeleteState>(
                        builder: (context, state) {
                          return IconButton(
                              onPressed: () {
                                context
                                    .read<MessageDeleteCubit>()
                                    .deleteMessagesFromDB(
                                      deleteParams: MessageDeleteParams(
                                          url: AppUrl.deleteMessage(user.id),
                                          direction: direction,
                                          delete: state.messageIds),
                                    );
                                MessageLogic.refreshState(
                                    refreshFunction: () =>
                                        BlocProvider.of<MessageActionBloc>(
                                                context)
                                            .add(LoadUserMessagesEvent(
                                                params: GetMessageParams(
                                                    url: AppUrl.getUserMessages(
                                                        user.id),
                                                    direction: direction))));
                              },
                              icon: Icon(
                                Icons.delete,
                                color: state.messageIds.isEmpty
                                    ? Colors.grey
                                    : Colors.red,
                              ));
                        },
                      ),
                    ],
                  ),
                  RefreshIndicator(
                    onRefresh: () async {
                      context.read<MessageActionBloc>().add(
                          LoadUserMessagesEvent(
                              params: GetMessageParams(
                                  url: AppUrl.getUserMessages(user.id),
                                  direction: direction)));
                      BlocProvider.of<MessageCheckboxCubit>(context)
                          .addItemsToMap(
                              MessageLogic.boolCreator(state.messages.length));
                    },
                    child: SingleChildScrollView(
                      controller: _listController,
                      child: Column(
                        children: List.generate(
                          state.messages.length,
                          (index) => Slidable(
                            startActionPane: ActionPane(
                                motion: const StretchMotion(),
                                children: [
                                  SlidableAction(
                                    borderRadius: BorderRadius.circular(
                                        kSmallButtonBorderRadius),
                                    onPressed: (context) {},
                                    icon: Icons.message,
                                    backgroundColor:
                                        ColorPallete.mainDecorationColor,
                                    label: 'Send',
                                  )
                                ]),
                            endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    borderRadius: BorderRadius.circular(
                                        kSmallButtonBorderRadius),
                                    backgroundColor: Colors.red,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                    onPressed: (context) => context
                                        .read<MessageDeleteCubit>()
                                        .deleteMessagesFromDB(
                                          deleteParams: MessageDeleteParams(
                                              url:
                                                  AppUrl.deleteMessage(user.id),
                                              direction: direction,
                                              delete: [
                                                state.messages[index].id
                                              ]),
                                        ),
                                  )
                                ]),
                            child: UserViewCard(
                                color: state.messages[index].isRead
                                    ? ColorPallete.whiteOpacity80
                                    : ColorPallete.mainDecorationColor,
                                margin: EdgeInsets.only(
                                    top: kMinEmptySpace,
                                    left: kGeneralPagesMargin,
                                    right: kGeneralPagesMargin,
                                    bottom: index == state.messages.length - 1
                                        ? 10
                                        : 0),
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundImage: NetworkImage(state
                                            .messages[0]
                                            .avatars![0]
                                            .profileAvatar),
                                      ),
                                      const Gap(kMinEmptySpace),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Text('From: '),
                                              Text(
                                                  state.messages[index].sender),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 200,
                                                child: Row(
                                                  children: [
                                                    const Text('Subject:',
                                                        style: AppTextStyle
                                                            .descriptionMid),
                                                    const Gap(kMidEmptySpace),
                                                    Expanded(
                                                      child: Text(
                                                        state.messages[index]
                                                            .subject,
                                                        style: AppTextStyle
                                                            .descriptionMid,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Gap(kMinEmptySpace),
                                              BlocBuilder<MessageCheckboxCubit,
                                                  MessageCheckboxState>(
                                                builder:
                                                    (context, messagesState) {
                                                  final messagesList =
                                                      state.messages;
                                                  return CheckBoxWidgets(
                                                      onTap: () {
                                                        context
                                                            .read<
                                                                MessageCheckboxCubit>()
                                                            .toggleNotfication(
                                                                index,
                                                                messagesState
                                                                        .isCheck
                                                                    ? false
                                                                    : true);

                                                        messagesState.checkBoxes[
                                                                    index]
                                                                ['isCheck']
                                                            ? context
                                                                .read<
                                                                    MessageDeleteCubit>()
                                                                .addIdToDelete(
                                                                    messagesList[
                                                                            index]
                                                                        .id)
                                                            : context
                                                                .read<
                                                                    MessageDeleteCubit>()
                                                                .deleteIdFromList(
                                                                    messagesList[
                                                                            index]
                                                                        .id);
                                                      },
                                                      isCheck: messagesState
                                                              .checkBoxes[index]
                                                          ['isCheck']);
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
