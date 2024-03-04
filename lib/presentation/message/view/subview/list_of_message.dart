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
import 'package:gap/gap.dart';

bool isChecked = true;

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
      child: Scaffold(body: SingleChildScrollView(
        child: BlocBuilder<MessageActionBloc, MessageActionState>(
          builder: (context, state) {
            BlocProvider.of<MessageCheckboxCubit>(context)
                .addItemsToMap(MessageLogic.boolCreator(state.messages.length));
            return Column(
              children: [
                Row(
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
                              Future.delayed(
                                  const Duration(seconds: 1),
                                  () => BlocProvider.of<MessageActionBloc>(
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
                    context.read<MessageActionBloc>().add(LoadUserMessagesEvent(
                        params: GetMessageParams(
                            url: AppUrl.getUserMessages(user.id),
                            direction: direction)));
                    BlocProvider.of<MessageCheckboxCubit>(context)
                        .addItemsToMap(
                            MessageLogic.boolCreator(state.messages.length));
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                      children: List.generate(
                        state.messages.length,
                        (index) => UserViewCard(
                            color: state.messages[index].isRead
                                ? ColorPallete.whiteOpacity80
                                : ColorPallete.mainDecorationColor,
                            margin: const EdgeInsets.only(
                                top: kMinEmptySpace,
                                left: kGeneralPagesMargin,
                                right: kGeneralPagesMargin),
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(state
                                    .messages[0].avatars![0].profileAvatar),
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'From:',
                                    style: AppTextStyle.descriptionMid,
                                  ),
                                  const Gap(kMidEmptySpace),
                                  Text(state.messages[index].sender,
                                      style: AppTextStyle.descriptionMid),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Text('Subject:',
                                          style: AppTextStyle.descriptionMid),
                                      const Gap(kMidEmptySpace),
                                      Text(state.messages[index].subject,
                                          style: AppTextStyle.descriptionMid),
                                    ],
                                  ),
                                  BlocBuilder<MessageCheckboxCubit,
                                      MessageCheckboxState>(
                                    builder: (context, messagesState) {
                                      final messagesList = state.messages;
                                      return CheckBoxWidgets(
                                          onTap: () {
                                            context
                                                .read<MessageCheckboxCubit>()
                                                .toggleNotfication(
                                                    index,
                                                    messagesState.isCheck
                                                        ? false
                                                        : true);

                                            messagesState.checkBoxes[index]
                                                    ['isCheck']
                                                ? context
                                                    .read<MessageDeleteCubit>()
                                                    .addIdToDelete(
                                                        messagesList[index].id)
                                                : context
                                                    .read<MessageDeleteCubit>()
                                                    .deleteIdFromList(
                                                        messagesList[index].id);
                                          },
                                          isCheck: messagesState
                                              .checkBoxes[index]['isCheck']);
                                    },
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      )),
    );
  }
}
