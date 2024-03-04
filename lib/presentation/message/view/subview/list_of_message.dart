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

//todo zrobic przejście do pojedynczej wiadomości
//todo zrobić boczny panel z wyborem odpowiedniej kategori wiadomości lub zmniejszyć przyciski górne,
// usunąć grafient divider
// zaimplementować przejście do pojedynczej wiadomości wysyłanej bezpośrednio do użytkownika

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
              final listMessages = state.messages;
              BlocProvider.of<MessageCheckboxCubit>(context).addItemsToMap(
                  MessageLogic.boolCreator(state.messages.length));
              return Column(
                children: [
                  const Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BlocBuilder<MessageDeleteCubit, MessageDeleteState>(
                        builder: (context, delete) {
                          return Row(
                            children: [
                              Visibility(
                                visible: delete.messageIds.isNotEmpty,
                                child: IconButton(
                                    onPressed: () {
                                      context
                                          .read<MessageDeleteCubit>()
                                          .deleteMessagesFromDB(
                                            deleteParams: MessageDeleteParams(
                                                url: AppUrl.deleteMessage(
                                                    user.id),
                                                direction: direction,
                                                delete: delete.messageIds),
                                          );
                                      MessageLogic.refreshState(
                                          refreshFunction: () => BlocProvider
                                                  .of<MessageActionBloc>(
                                                      context)
                                              .add(LoadUserMessagesEvent(
                                                  params: GetMessageParams(
                                                      url: AppUrl
                                                          .getUserMessages(
                                                              user.id),
                                                      direction: direction))));
                                    },
                                    icon: Badge(
                                      label: Text(
                                          delete.messageIds.length.toString()),
                                      isLabelVisible: delete.messageIds.isEmpty
                                          ? false
                                          : true,
                                      child: Icon(
                                        Icons.delete,
                                        color: delete.messageIds.isEmpty
                                            ? Colors.grey
                                            : Colors.red,
                                      ),
                                    )),
                              ),
                              Visibility(
                                visible: delete.messageIds.isNotEmpty,
                                child: GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<MessageDeleteCubit>(
                                              context)
                                          .addAllToDelete(
                                              MessageLogic.generateIdsList(
                                                  messages: state.messages));
                                      BlocProvider.of<MessageCheckboxCubit>(
                                              context)
                                          .addAllToDelete(
                                              MessageLogic.generateCheckedBox(
                                                  listSize:
                                                      state.messages.length));
                                    },
                                    child: const Text('ALL')),
                              ),
                              Visibility(
                                  visible: delete.messageIds.isNotEmpty,
                                  child: IconButton(
                                      onPressed: () {
                                        BlocProvider.of<MessageDeleteCubit>(
                                                context)
                                            .clearDeleteList();
                                        BlocProvider.of<MessageCheckboxCubit>(
                                                context)
                                            .addAllToDelete(
                                                MessageLogic.generateCheckedBox(
                                                    listSize:
                                                        state.messages.length,
                                                    wantToCheck: false));
                                      },
                                      icon: const Icon(Icons.cancel))),
                            ],
                          );
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
                            child: BlocBuilder<MessageCheckboxCubit,
                                MessageCheckboxState>(
                              builder: (context, isCheck) {
                                return GestureDetector(
                                  onLongPress: () {
                                    context
                                        .read<MessageCheckboxCubit>()
                                        .toggleNotfication(index,
                                            isCheck.isCheck ? false : true);
                                    isCheck.checkBoxes[index]['isCheck']
                                        ? context
                                            .read<MessageDeleteCubit>()
                                            .addIdToDelete(
                                                listMessages[index].id)
                                        : context
                                            .read<MessageDeleteCubit>()
                                            .deleteIdFromList(
                                                listMessages[index].id);
                                  },
                                  child: UserViewCard(
                                      color: isCheck.checkBoxes[index]
                                              ['isCheck']
                                          ? Colors.red
                                          : state.messages[index].isRead
                                              ? ColorPallete.whiteOpacity80
                                              : ColorPallete
                                                  .mainDecorationColor,
                                      margin: EdgeInsets.only(
                                          top: kMinEmptySpace,
                                          left: kGeneralPagesMargin,
                                          right: kGeneralPagesMargin,
                                          bottom:
                                              index == state.messages.length - 1
                                                  ? 10
                                                  : 0),
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 20,
                                              backgroundImage: NetworkImage(
                                                  state.messages[0].avatars![0]
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
                                                    Text(state.messages[index]
                                                        .sender),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: 200,
                                                      child: Row(
                                                        children: [
                                                          const Text('Subject:',
                                                              style: AppTextStyle
                                                                  .descriptionMid),
                                                          const Gap(
                                                              kMidEmptySpace),
                                                          Expanded(
                                                            child: Text(
                                                              state
                                                                  .messages[
                                                                      index]
                                                                  .subject,
                                                              style: AppTextStyle
                                                                  .descriptionMid,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const Gap(kMinEmptySpace),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ]),
                                );
                              },
                            ),
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
