import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/domains/messages/entities/message_entity.dart';
import 'package:climbapp/presentation/message/business/cubit/view/message_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagePreview extends StatelessWidget {
  const MessagePreview({required this.message, super.key});
  final MessageEntity message;
  static Route route({required MessageEntity message}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeSingleMessage),
        builder: (_) => MessagePreview(
              message: message,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () => BlocProvider.of<MessageViewCubit>(context)
                    .changeView(MessageView.received),
                icon: const Icon(Icons.arrow_back)),
            // TODO Reply to user
            IconButton(
                onPressed: () {
                  BlocProvider.of<MessageViewCubit>(context)
                      .changeView(MessageView.reply, message: message);
                },
                icon: const Icon(Icons.reply)),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Text('From: ${message.sender}'),
        const SizedBox(
          height: 5,
        ),
        RichText(
          text: TextSpan(
              style: const TextStyle(color: Colors.black, fontSize: 15),
              children: <TextSpan>[
                const TextSpan(
                    text: 'Subject: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: message.subject),
              ]),
        ),
        const SizedBox(
          height: 5,
        ),
        Text('Content:\n\n ${message.content}\n'),
        const SizedBox(
          height: 5,
        ),
        Text('Sent on: ${message.createdAt}'),
      ]),
    )));
  }
}
