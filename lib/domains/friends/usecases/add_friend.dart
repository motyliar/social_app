import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/friends/repository/friends_repository.dart';

class AddFriendUseCase extends UseCase<String, GetFriendsParams> {
  AddFriendUseCase({required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;
  final FriendsRepository _friendsRepository;

  @override
  EitherFunc<String> execute(GetFriendsParams friend) {
    return _friendsRepository.addFriend(friend);
  }
}
