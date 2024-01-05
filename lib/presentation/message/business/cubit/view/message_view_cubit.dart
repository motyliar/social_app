import 'package:bloc/bloc.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/domains/messages/entities/message_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'message_view_state.dart';

class MessageViewCubit extends Cubit<MessageViewState> {
  MessageViewCubit() : super(MessageViewInitial());

  void changeView(MessageView view, {MessageEntity? message}) {
    switch (view) {
      case MessageView.send:
        emit(MessageViewSend());
      case MessageView.received:
        emit(MessageViewRecivied());
      case MessageView.create:
        emit(MessageViewNewMessage());
      case MessageView.message:
        emit(MessageViewMessage(message: message!));
      case MessageView.reply:
        emit(MessageViewReply(message: message!));
      default:
        emit(MessageViewInitial());
    }
  }
}
