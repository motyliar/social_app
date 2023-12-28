import 'package:climbapp/core/services/user_container.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/presentation/message/business/bloc/message/message_action_bloc.dart';
import 'package:climbapp/presentation/message/business/cubit/cubit/message_view_cubit.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfMessage extends StatelessWidget {
  final String direction;
  const ListOfMessage({required this.direction, super.key});

  @override
  Widget build(BuildContext context) {
    print(direction);
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return BlocProvider(
      create: (_) => userLocator<MessageActionBloc>()
        ..add(LoadUserMessagesEvent(
            params: GetMessageParams(direction: direction, userId: user.id))),
      child: Scaffold(body: BlocBuilder<MessageActionBloc, MessageActionState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () => BlocProvider.of<MessageViewCubit>(context)
                .changeView(MessageView.message),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                    );
                  }),
            ),
          );
        },
      )),
    );
  }
}
