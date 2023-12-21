import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/friends/models/friends_model.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

abstract class FriendsLocaleDataSource {
  EitherFunc<List<FriendsModel>> getFriendsFromHive();
  Future<void> addFriendsToHive(List<FriendsModel> friends);
  Future<void> deleteFriendFromHive(String userId);
}

class FriendsLocalDataSourceImpl extends FriendsLocaleDataSource {
  final Box<FriendsModel> friendsBox = Hive.box<FriendsModel>('friends-box');
  @override
  EitherFunc<List<FriendsModel>> getFriendsFromHive() async {
    if (friendsBox.isEmpty) {
      return Left(Exception('empty-box'));
    } else {
      return Right(friendsBox.values.toList());
    }
  }

  @override
  Future<void> addFriendsToHive(List<FriendsModel> friends) async {
    await friendsBox.clear();
    friends.forEach((friend) async {
      await friendsBox.add(friend);
    });
  }

  @override
  Future<void> deleteFriendFromHive(String userId) async {
    await friendsBox.delete(userId);
  }
}
