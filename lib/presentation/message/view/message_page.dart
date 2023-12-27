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
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
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
                              context.read<MessageActionBloc>()
                                ..add(SendMessageEvent(
                                    params: MessageParams(
                                        to: details.recipientId,
                                        from: details.senderId,
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
    );
  }
}
