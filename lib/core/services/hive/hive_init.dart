import 'package:climbapp/data/friends/models/friends_model.dart';
import 'package:climbapp/data/message/models/message_model.dart';
import 'package:climbapp/data/notice/models/notice_model.dart';
import 'package:climbapp/data/notice/models/sub_models/notice_submodels.dart';
import 'package:climbapp/data/onBoard/model/on_board_model.dart';
import 'package:climbapp/data/user/models/sub_models/sub_models.dart';
import 'package:climbapp/data/user/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveInit {
  Future<void> init() async {
    try {
      await _register();
      await _openHiveBoxes();
    } catch (e) {
      Exception(e);
    }
  }

  Future<void> _register() async {
    await Hive.initFlutter();
    Hive
      ..registerAdapter(UserModelAdapter())
      ..registerAdapter(UserPreferencesModelAdapter())
      ..registerAdapter(UserDetailsModelAdapter())
      ..registerAdapter(UserActiveModelAdapter())
      ..registerAdapter(FriendsModelAdapter())
      ..registerAdapter(MessageModelAdapter())
      ..registerAdapter(NoticeModelAdapter())
      ..registerAdapter(ContentModelAdapter())
      ..registerAdapter(CommentsModelAdapter())
      ..registerAdapter(OnBoardModelAdapter());
  }

  Future<void> _openHiveBoxes() async {
    await Hive.openBox<UserModel>('user-data');
    await Hive.openBox<FriendsModel>('friends-box');
    await Hive.openBox<OnBoardModel>('on-board');
  }
}
