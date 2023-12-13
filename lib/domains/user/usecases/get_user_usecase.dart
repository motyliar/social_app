import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/core/utils/helpers/usecase.dart';
import 'package:climbapp/domains/user/entities/user_entity.dart';
import 'package:climbapp/domains/user/repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserUseCase extends UseCase<UserEntity, GetUserParams> {
  GetUserUseCase(this._userRepository);
  final UserRepository _userRepository;
  @override
  Future<Either<Exception, UserEntity>> execute(GetUserParams user) {
    return _userRepository.getUser(user);
  }
}
