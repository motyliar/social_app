/// File params contains classes of Params used in Repository UseCase

/// [UserParams] store 2 variables for UserGetUseCase
class GetUserParams {
  const GetUserParams({required this.token, required this.userId});
  final String token;
  final String userId;
}
