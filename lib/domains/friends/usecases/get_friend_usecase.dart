import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:climbapp/domains/friends/repository/friends_repository.dart';

class GetFriendUseCase extends UseCase<List<FriendsEntity>, GetFriendsParams> {
  GetFriendUseCase({required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;
  final FriendsRepository _friendsRepository;

  @override
  EitherFunc<List<FriendsEntity>> execute(GetFriendsParams friends) {
    return _friendsRepository.getFriends(friends);
  }
}
