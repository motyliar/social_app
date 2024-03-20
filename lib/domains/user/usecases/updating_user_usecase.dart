import 'package:climbapp/core/datahelpers/params/user/user_params.dart';
import 'package:climbapp/domains/notice/usecases/i_usecase.dart';
import 'package:climbapp/domains/user/entities/user_entity.dart';
import 'package:climbapp/domains/user/repository/user_repository.dart';

import '../../../core/utils/helpers/helpers.dart';

class UpdatingUserUseCase
    extends IUseCase<UserRepository, UserEntity, UpdatingUserParams> {
  UpdatingUserUseCase({required super.repository});

  @override
  EitherFunc<UserEntity> execute(UpdatingUserParams params) {
    return repository_.updating(params);
  }
}
