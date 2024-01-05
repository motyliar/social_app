part of 'message_checkbox_cubit.dart';

class MessageCheckboxState extends Equatable {
  const MessageCheckboxState({required this.checkBoxes});
  final List<Map> checkBoxes;

  MessageCheckboxState copyWith({final List<Map>? checkBoxes}) =>
      MessageCheckboxState(checkBoxes: checkBoxes ?? this.checkBoxes);

  @override
  List<Object> get props => [checkBoxes];
}
