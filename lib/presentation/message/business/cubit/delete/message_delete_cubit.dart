import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/message/message_params.dart';
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/domains/messages/usecases/delete_message_usecase.dart';
import 'package:equatable/equatable.dart';

part 'message_delete_state.dart';

class MessageDeleteCubit extends Cubit<MessageDeleteState> {
  final DeleteMessageUseCase _deleteMessageUseCase;
  MessageDeleteCubit({required DeleteMessageUseCase deleteMessageUseCase})
      : _deleteMessageUseCase = deleteMessageUseCase,
        super(const MessageDeleteState(messageIds: <String>[]));

  void addIdToDelete(String messageId) {
    emit(state.copyWith(
        messageIds: List.from(state.messageIds)..add(messageId)));
    print('add ${state.messageIds}');
  }

  void deleteIdFromList(String messageId) {
    final newStateList = List.from(state.messageIds);
    newStateList.removeWhere((message) => message == messageId);
    emit(state.copyWith(messageIds: List.from(newStateList)));
    print('delete ${state.messageIds}');
  }

  Future<void> deleteMessagesFromDB(
      {required MessageDeleteParams deleteParams}) async {
    await _deleteMessageUseCase.execute(deleteParams).then((response) =>
        response.fold((failure) => print(failure),
            (data) => emit(state.copyWith(messageIds: <String>[]))));
  }

  void addAllToDelete(List<String> idsList) {
    emit(state.copyWith(messageIds: List.from(idsList)));
  }

  void clearDeleteList() {
    emit(state.copyWith(messageIds: List.from([])));
  }
}
