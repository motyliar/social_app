import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/datahelpers/params/message/message_params.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/core/utils/helpers/extension.dart';
import 'package:climbapp/presentation/app/widgets/loading_state.dart';
import 'package:climbapp/presentation/message/business/bloc/message/message_action_bloc.dart';
import 'package:climbapp/presentation/message/business/cubit/checkbox/message_checkbox_cubit.dart';
import 'package:climbapp/presentation/message/business/cubit/delete/message_delete_cubit.dart';
import 'package:climbapp/presentation/message/business/cubit/view/message_view_cubit.dart';
import 'package:climbapp/presentation/message/business/logic/message_logic.dart';
import 'package:climbapp/presentation/message/widgets/widgets.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageMain extends StatelessWidget {
  const MessageMain({required this.direction, super.key});

  final String direction;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final user = context.select((UserBloc userBloc) => userBloc.state.user);
    String today = DateTime.now().toString().isTooLong(10);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userLocator<MessageActionBloc>()
            ..add(
              LoadUserMessagesEvent(
                params: GetMessageParams(
                  url: AppUrl.getUserMessages(user.id),
                  direction: direction,
                ),
              ),
            ),
        ),
        BlocProvider(
          create: (_) => userLocator<MessageDeleteCubit>(),
        )
      ],
      child: Scaffold(
        backgroundColor: ColorPallete.scaffoldBackground,
        body: BlocBuilder<MessageActionBloc, MessageActionState>(
          builder: (context, messages) {
            BlocProvider.of<MessageCheckboxCubit>(context).addItemsToMap(
                MessageLogic.boolCreator(messages.messages.length));
            if (messages is MessageActionInitial) {
              return const LoadingState();
            }
            final listMessages = messages.messages.reversed.toList();
            return SafeArea(
              child: CustomScrollView(slivers: [
                CustomSliverAppBar(
                  direction: direction,
                  user: user,
                  messages: listMessages,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => CreatingSlidableActions(
                            message: messages.messages[index],
                            l10n: l10n,
                            user: user,
                            index: index,
                            direction: direction,
                            today: today,
                            child: BlocBuilder<MessageCheckboxCubit,
                                MessageCheckboxState>(
                              builder: (context, isCheck) {
                                return BlocBuilder<MessageViewCubit,
                                    MessageViewState>(
                                  builder: (context, view) {
                                    return GestureDetector(
                                      onTap: () => {
                                        BlocProvider.of<MessageViewCubit>(
                                                context)
                                            .changeView(MessageView.message,
                                                message:
                                                    messages.messages[index]),
                                        context.read<MessageActionBloc>().add(
                                              UpdateMessageEvent(
                                                params: _updateIsReadParams(
                                                  userId: user.id,
                                                  idToUpdate:
                                                      listMessages[index].id,
                                                ),
                                              ),
                                            ),
                                      },
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
                                      child: SingleMessageTile(
                                          avatar: AnimatedAvatar(
                                            isRead: isCheck.checkBoxes[index]
                                                ['isCheck'],
                                            avatarImage: listMessages[
                                                    listMessages.length - 1]
                                                .avatars![0]
                                                .profileAvatar,
                                          ),
                                          description: MessageDescriptions(
                                              message: listMessages[index],
                                              today: today),
                                          isSelected: isCheck.checkBoxes[index]
                                              ['isCheck'],
                                          isRead: listMessages[index].isRead,
                                          today: today),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                      childCount: messages.messages.length),
                )
              ]),
            );
          },
        ),
      ),
    );
  }

  MessageUpdateParams<bool> _updateIsReadParams(
          {required String userId, required String idToUpdate}) =>
      MessageUpdateParams<bool>(
        direction: direction,
        url: AppUrl.updateMessage(userId),
        update: true,
        field: 'isRead',
        messageId: idToUpdate,
      );
}
