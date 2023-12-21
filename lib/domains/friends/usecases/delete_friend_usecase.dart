import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/friends/repository/friends_repository.dart';

class DeleteFriendUseCase extends UseCase<String, GetFriendsParams> {
  DeleteFriendUseCase({required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;
  final FriendsRepository _friendsRepository;

  EitherFunc<String> execute(GetFriendsParams friend) {
    return _friendsRepository.deleteFriend(friend);
  }
}
