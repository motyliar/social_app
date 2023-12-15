import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';

abstract class FriendsRepository {
  EitherFunc<List<FriendsEntity>> getFriends(GetFriendsParams friends);
}
