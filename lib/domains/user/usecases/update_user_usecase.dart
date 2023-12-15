import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/user/entities/user_entity.dart';
import 'package:climbapp/domains/user/repository/user_repository.dart';

class UpdateUserUseCase {
  const UpdateUserUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;
  final UserRepository _userRepository;

  EitherFunc<UserEntity> execute<T>(UpdateUserParams<T> update) {
    return _userRepository.updateUser(update);
  }
}
