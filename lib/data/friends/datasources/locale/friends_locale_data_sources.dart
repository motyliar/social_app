import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/friends/models/friends_model.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

abstract class FriendsLocaleDataSource {
  EitherFunc<List<FriendsModel>> getFriendsFromHive();
  void addFriendsToHive(List<FriendsModel> friends);
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
  void addFriendsToHive(List<FriendsModel> friends) async {
    friends.forEach((friend) => friendsBox.add(friend));
  }
}
