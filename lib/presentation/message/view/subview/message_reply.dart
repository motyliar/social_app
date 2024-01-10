import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/datahelpers/params/message/message_params.dart';
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/domains/messages/entities/message_entity.dart';
import 'package:climbapp/presentation/message/business/bloc/message/message_action_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageReply extends StatelessWidget {
  MessageReply({required this.message, super.key});
  final MessageEntity message;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _subject =
        TextEditingController(text: 'FWD: ${message.subject}');
    TextEditingController _content = TextEditingController(text: '''
    
    
    ${message.sender} sent on ${message.createdAt}
    previous message:

    ${message.content}
    ''');
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Reply to : ${message.sender}',
            ),
            SizedBox(
              height: 15,
            ),
            Text('Subject: '),
            TextFormField(
              controller: _subject,
            ),
            TextFormField(
              minLines: 5,
              maxLines: 50,
              controller: _content,
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<MessageActionBloc>(context).add(
                    SendMessageEvent(
                        params: MessageRequestParams(
                            url: Uri.parse(
                              AppUrl.sendMessageUrl(),
                            ),
                            direction: 'send',
                            singleMessage: SingleMessage(
                              to: message.from,
                              from: message.to,
                              sender: message.recipient,
                              recipient: message.sender,
                              content: _content.text,
                              subject: _subject.text,
                            ))),
                  );
                },
                child: Text('SEND')),
          ],
        ),
      )),
    );
  }
}
