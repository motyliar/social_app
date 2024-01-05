part of 'message_checkbox_cubit.dart';

class MessageCheckboxState extends Equatable {
  const MessageCheckboxState({
    required this.checkBoxes,
    required this.isCheck,
  });
  final List<Map> checkBoxes;
  final bool isCheck;

  MessageCheckboxState copyWith(
          {final List<Map>? checkBoxes, final bool? isCheck}) =>
      MessageCheckboxState(
          checkBoxes: checkBoxes ?? this.checkBoxes,
          isCheck: isCheck ?? this.isCheck);

  @override
  List<Object> get props => [checkBoxes, isCheck];
}
