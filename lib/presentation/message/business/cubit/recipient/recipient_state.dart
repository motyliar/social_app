part of 'recipient_cubit.dart';

class RecipientState extends Equatable {
  const RecipientState({this.recipient});
  final FriendsEntity? recipient;

  RecipientState copyWith({FriendsEntity? recipient}) =>
      RecipientState(recipient: recipient ?? this.recipient);
  @override
  List<Object?> get props => [recipient];
}
