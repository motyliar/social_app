part of 'user_register_bloc.dart';

sealed class UserRegisterEvent extends Equatable {
  const UserRegisterEvent();

  @override
  List<Object> get props => [];
}

class AddUserToFireBaseEvent extends UserRegisterEvent {
  const AddUserToFireBaseEvent({required this.newUser});
  final RegisterEntites newUser;
  @override
  List<Object> get props => [newUser];
}

class AddUserToMongoDB extends UserRegisterEvent {
  const AddUserToMongoDB({required this.newUser});
  final RegisterEntites newUser;
  List<Object> get props => [newUser];
}
