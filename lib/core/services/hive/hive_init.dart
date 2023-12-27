import 'package:climbapp/data/friends/models/friends_model.dart';
import 'package:climbapp/data/message/models/message_model.dart';
import 'package:climbapp/data/user/models/sub_models/sub_models.dart';
import 'package:climbapp/data/user/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveInit {
  Future<void> register() async {
    await Hive.initFlutter();
    Hive
      ..registerAdapter(UserModelAdapter())
      ..registerAdapter(UserPreferencesModelAdapter())
      ..registerAdapter(UserDetailsModelAdapter())
      ..registerAdapter(UserActiveModelAdapter())
      ..registerAdapter(FriendsModelAdapter())
      ..registerAdapter(MessageModelAdapter());

    await Hive.openBox<UserModel>('user-data');
    await Hive.openBox<FriendsModel>('friends-box');
  }
}
