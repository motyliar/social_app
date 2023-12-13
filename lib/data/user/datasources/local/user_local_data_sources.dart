import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/user/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class UserLocalDataSources {
  EitherFunc<UserModel> getUserFromHive();
  Future<void> addUserToHive(UserModel user);
  Future<void> updateHiveUser(UserModel user);
}

class UserLocalDataSourcesImpl extends UserLocalDataSources {
  final Box<UserModel> localUserDB = Hive.box<UserModel>('user-box');
  @override
  EitherFunc<UserModel> getUserFromHive() async {
    final currentUser = localUserDB.get(0);
    if (currentUser == null) {
      return Left(Exception());
    } else {
      return Right(currentUser);
    }
  }

  @override
  Future<void> addUserToHive(UserModel user) async {
    await localUserDB.add(user);
  }

  @override
  Future<void> updateHiveUser(UserModel user) async {
    final userFromHive = localUserDB.get(0);
    if (userFromHive != null) {
      await localUserDB.put(0, user);
    } else {
      await localUserDB.add(user);
    }
  }
}
