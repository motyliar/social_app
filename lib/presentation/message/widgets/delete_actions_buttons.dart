import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/datahelpers/params/message/message_params.dart';
import 'package:climbapp/domains/messages/entities/message_entity.dart';
import 'package:climbapp/domains/user/entities/user_entity.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/message/business/bloc/message/message_action_bloc.dart';
import 'package:climbapp/presentation/message/business/cubit/checkbox/message_checkbox_cubit.dart';
import 'package:climbapp/presentation/message/business/cubit/delete/message_delete_cubit.dart';
import 'package:climbapp/presentation/message/business/logic/message_logic.dart';

import 'package:flutter/material.dart';

class DeleteActionButtons extends StatelessWidget {
  const DeleteActionButtons({
    super.key,
    required this.user,
    required this.direction,
    required this.messages,
  });

  final UserEntity user;
  final String direction;
  final List<MessageEntity> messages;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageDeleteCubit, MessageDeleteState>(
      builder: (context, delete) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    context.read<MessageDeleteCubit>().deleteMessagesFromDB(
                          deleteParams: MessageDeleteParams(
                              url: AppUrl.deleteMessage(user.id),
                              direction: direction,
                              delete: delete.messageIds),
                        );
                    MessageLogic.refreshState(
                        refreshFunction: () => {
                              BlocProvider.of<MessageActionBloc>(context).add(
                                LoadUserMessagesEvent(
                                  params: GetMessageParams(
                                      url: AppUrl.getUserMessages(user.id),
                                      direction: direction),
                                ),
                              ),
                              BlocProvider.of<MessageDeleteCubit>(context)
                                  .clearDeleteList(),
                            });
                  },
                  icon: Badge(
                    label: Text(delete.messageIds.length.toString()),
                    isLabelVisible: delete.messageIds.isEmpty ? false : true,
                    child: Icon(
                      Icons.delete,
                      color:
                          delete.messageIds.isEmpty ? Colors.grey : Colors.red,
                    ),
                  )),
              GestureDetector(
                  onTap: () {
                    BlocProvider.of<MessageDeleteCubit>(context).addAllToDelete(
                        MessageLogic.generateIdsList(messages: messages));
                    BlocProvider.of<MessageCheckboxCubit>(context)
                        .addAllToDelete(MessageLogic.generateCheckedBox(
                            listSize: messages.length));
                  },
                  child: const Text('ALL')),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<MessageDeleteCubit>(context)
                        .clearDeleteList();
                    BlocProvider.of<MessageCheckboxCubit>(context)
                        .addAllToDelete(MessageLogic.generateCheckedBox(
                            listSize: messages.length, wantToCheck: false));
                  },
                  icon: const Icon(Icons.cancel)),
            ],
          ),
        );
      },
    );
  }
}
