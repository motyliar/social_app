import 'package:bloc/bloc.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'message_view_state.dart';

class MessageViewCubit extends Cubit<MessageViewState> {
  MessageViewCubit() : super(MessageViewInitial());

  void changeView(MessageView view) {
    switch (view) {
      case MessageView.send:
        emit(MessageViewSend());
      case MessageView.received:
        emit(MessageViewRecivied());
      case MessageView.create:
        emit(MessageViewNewMessage());
      case MessageView.message:
        emit(MessageViewMessage());
      default:
        emit(MessageViewInitial());
    }
  }
}
