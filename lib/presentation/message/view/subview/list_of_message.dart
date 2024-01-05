import 'package:climbapp/core/services/user_container.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/presentation/message/business/bloc/message/message_action_bloc.dart';
import 'package:climbapp/presentation/message/business/cubit/checkbox/message_checkbox_cubit.dart';
import 'package:climbapp/presentation/message/business/cubit/view/message_view_cubit.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

bool isChecked = true;

class ListOfMessage extends StatelessWidget {
  final String direction;
  const ListOfMessage({required this.direction, super.key});

  @override
  Widget build(BuildContext context) {
    print(direction);
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => userLocator<MessageActionBloc>()
            ..add(LoadUserMessagesEvent(
                params:
                    GetMessageParams(direction: direction, userId: user.id))),
        ),
        BlocProvider(
          create: (context) => MessageCheckboxCubit(),
        ),
      ],
      child: Scaffold(body: BlocBuilder<MessageActionBloc, MessageActionState>(
        builder: (context, state) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
                itemCount: state.messages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<MessageViewCubit>(context).changeView(
                          MessageView.message,
                          message: state.messages[index]);
                      context.read<MessageActionBloc>().add(UpdateMessageEvent(
                              params: GetMessageParams<bool>(
                            userId: user.id,
                            direction: direction,
                            update: true,
                            field: "isRead",
                            messageId: state.messages[index].id,
                          )));

                      print('//${user.id}  ${state.messages[index].id}');
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlocBuilder<MessageCheckboxCubit,
                                MessageCheckboxState>(
                              builder: (context, state) {
                                return Checkbox(
                                  value: isChecked,
                                  onChanged: (newValue) =>
                                      isChecked = newValue!,
                                );
                              },
                            ),
                            Text('From: ${state.messages[index].sender}'),
                            IconButton(
                                onPressed: () {
                                  context.read<MessageActionBloc>().add(
                                        DeleteMessagesEvent(
                                          params: GetMessageParams(
                                            userId: user.id,
                                            direction: direction,
                                            messageId: state.messages[index].id,
                                          ),
                                        ),
                                      );
                                },
                                icon: Icon(Icons.delete)),
                          ],
                        ),
                        Text(
                          state.messages[index].subject,
                          style: TextStyle(
                              fontWeight: state.messages[index].isRead
                                  ? FontWeight.normal
                                  : FontWeight.bold),
                        ),
                        Divider(),
                      ],
                    ),
                  );
                }),
          );
        },
      )),
    );
  }
}
