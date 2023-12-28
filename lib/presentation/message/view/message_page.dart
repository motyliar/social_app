import 'package:climbapp/core/services/user_container.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/presentation/message/business/bloc/message/message_action_bloc.dart';
import 'package:flutter/material.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController _subjectController = TextEditingController();
TextEditingController _contentController = TextEditingController();

class MessagePage extends StatelessWidget {
  final MessageUserDetails details;
  const MessagePage({required this.details, super.key});
  static Route<dynamic> route(MessageUserDetails details) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeMessagePage),
      builder: (_) => MessagePage(
        details: details,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _messageKey = GlobalKey<FormState>();
    print(details.toString());
    return BlocProvider(
      create: (context) => userLocator<MessageActionBloc>()
        ..add(LoadUserMessagesEvent(
            params:
                GetMessageParams(userId: details.senderId, direction: "send"))),
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<MessageActionBloc, MessageActionState>(
                builder: (context, state) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 300,
                    child: ListView.builder(
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('From: ${state.messages[index].sender}'),
                              Text(
                                  'Recipient: ${state.messages[index].recipient}'),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                  'Subject:  ${state.messages[index].subject}'),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.receipt)),
                            ],
                          ),
                          Text(state.messages[index].content)
                        ],
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.back_hand)),
              Text('To: ${details.recipientName}'),
              Text('Send Message'),
              Form(
                  key: _messageKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Subject:'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.70,
                              child: TextFormField(
                                controller: _subjectController,
                                decoration:
                                    InputDecoration(hintText: 'Type subject'),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text('Content:'),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          controller: _contentController,
                          minLines: 5,
                          maxLines: 20,
                          decoration: InputDecoration(hintText: 'Type message'),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      BlocBuilder<MessageActionBloc, MessageActionState>(
                        builder: (context, state) {
                          return ElevatedButton(
                              onPressed: () {
                                context.read<MessageActionBloc>().add(
                                    SendMessageEvent(
                                        params: MessageParams(
                                            to: details.recipientId,
                                            from: details.senderId,
                                            sender: details.senderName,
                                            recipient: details.recipientName,
                                            subject: _subjectController.text,
                                            content: _contentController.text)));
                              },
                              child: Text('SEND'));
                        },
                      ),
                    ],
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
