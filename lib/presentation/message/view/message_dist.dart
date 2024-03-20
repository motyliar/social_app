import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/datahelpers/params/message_view.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/message/business/cubit/view/message_view_cubit.dart';
import 'package:climbapp/presentation/message/view/message_main.dart';
import 'package:climbapp/presentation/message/view/subview/create_new_message.dart';

import 'package:flutter/material.dart';

const String _directionReceived = kReceivedMessageDirection;
const String _directionSend = kSendMessageDirection;

class MessageDistributor extends StatelessWidget {
  const MessageDistributor({super.key, this.params});

  static Route route({MessageViewParams? view}) => MaterialPageRoute(
      settings: const RouteSettings(name: routeMessagePage),
      builder: (_) => MessageDistributor(
            params: view,
          ));
  final MessageViewParams? params;
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => MessageViewCubit()
          ..changeView(params?.view ?? MessageView.received),
        child: BlocBuilder<MessageViewCubit, MessageViewState>(
            builder: (context, viewState) {
          if (viewState is MessageViewInitial) {
            return const MessageMain(direction: _directionReceived);
          }
          if (viewState is MessageViewSend) {
            return MessageMain(
              direction: _directionSend,
              key: UniqueKey(),
            );
          }
          if (viewState is MessageViewNewMessage) {
            return CreateNewMessage();
          }
          if (viewState is MessageViewOtherMessage) {
            return CreateNewMessage(
              friend: params!.friend,
            );
          }
          if (viewState is MessageViewMessage) {
            return MessagePreview(
              message: viewState.message,
            );
          }
          if (viewState is MessageViewReply) {
            return CreateNewMessage(message: viewState.message);
          } else {
            return MessageMain(
              direction: _directionReceived,
              key: UniqueKey(),
            );
          }
        }),
      );
}
