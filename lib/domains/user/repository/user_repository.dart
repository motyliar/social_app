// ignore: unused_import
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/user/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';

abstract class UserRepository {
  Future<Either<Exception, UserEntity>> getUser(GetUserParams user);
  EitherFunc<UserEntity> updateUser<T>(UpdateUserParams<T> update);
}

/// [updateMap] class created to store const of Map used in updated user values
class updateMap {
  static Map<String, String> avatar(String update) => {"profileAvatar": update};
  static Map<String, Map<String, int>> age(int update) => {
        "details": {"age": update}
      };
  static Map<String, String> name(String update) => {"userName": update};
  static Map<String, Map<String, bool>> themeMode(bool update) => {
        "preferences": {"mode": update}
      };
  static Map<String, Map<String, bool>> active(bool update) => {
        "active": {"isActive": update}
      };
  static Map<String, Map<String, String>> language(String update) => {
        "preferences": {"language": update}
      };
}
