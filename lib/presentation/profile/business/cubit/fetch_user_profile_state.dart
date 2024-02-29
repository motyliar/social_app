part of 'fetch_user_profile_cubit.dart';

sealed class FetchUserProfileState extends Equatable {
  const FetchUserProfileState();

  @override
  List<Object> get props => [];
}

class FetchUserProfileLoading extends FetchUserProfileState {}

class FetchUserProfileLoaded extends FetchUserProfileState {
  const FetchUserProfileLoaded({required this.user});
  final UserEntity user;

  @override
  List<Object> get props => [user];
}

class FetchUserProfileError extends FetchUserProfileState {
  const FetchUserProfileError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
