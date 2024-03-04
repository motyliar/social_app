import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'message_checkbox_state.dart';

List<Map> checkName = [
  {'mail': 'name', 'isCheck': false},
  {'mail': 'name', 'isCheck': false}
];

class MessageCheckboxCubit extends Cubit<MessageCheckboxState> {
  MessageCheckboxCubit()
      : super(const MessageCheckboxState(checkBoxes: <Map>[], isCheck: false));

  void addItemsToMap(List<Map> newItems) {
    emit(state.copyWith(checkBoxes: newItems, isCheck: state.isCheck));
  }

  void toggleNotfication(int index, bool value) => emit(state.copyWith(
      checkBoxes: List.from(state.checkBoxes)
        ..[index]['isCheck'] =
            state.checkBoxes[index]['isCheck'] ? false : true,
      isCheck: value));

  void addAllToDelete(List<Map<dynamic, dynamic>> allElements) {
    emit(state.copyWith(checkBoxes: List.from(allElements)));
  }
}
