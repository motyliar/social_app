import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'message_checkbox_state.dart';

List<Map> checkName = [
  {'mail': 'name', 'isCheck': false},
  {'mail': 'name', 'isCheck': false}
];

class MessageCheckboxCubit extends Cubit<MessageCheckboxState> {
  MessageCheckboxCubit() : super(MessageCheckboxState(checkBoxes: checkName));

  void toggleNotfication(int index, bool newValue) => emit(state.copyWith(
      checkBoxes: List.from(state.checkBoxes)..[index]['isCheck'] = newValue));
}
