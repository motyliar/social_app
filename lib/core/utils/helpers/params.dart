/// File params contains classes of Params used in Repository UseCase

/// [GetUserParams] store 2 variables for UserGetUseCase
class GetUserParams {
  const GetUserParams({required this.token, required this.userId});
  final String token;
  final String userId;

  @override
  toString() => 'token: $token , userId: $userId';
}

class UpdateUserParams<T> {
  const UpdateUserParams(
      {required this.userId, required this.token, required this.toUpdate});
  final String userId;
  final String token;
  final Map<String, T> toUpdate;
}

class GetFriendsParams {
  const GetFriendsParams({required this.userId, this.friendIds});
  final String userId;
  final List<String>? friendIds;
}
