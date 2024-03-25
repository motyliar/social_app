part of 'fetch_requested_users_cubit.dart';

class FetchRequestedUsersState extends Equatable {
  const FetchRequestedUsersState({required this.users});
  final List<RequestsEntity> users;

  @override
  List<Object> get props => [users];
}

final class FetchRequestedUsersFailed extends FetchRequestedUsersState {
  const FetchRequestedUsersFailed({required super.users});
}

final class FetchRequestedUsersLoading extends FetchRequestedUsersState {
  const FetchRequestedUsersLoading({required super.users});
}
