import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:climbapp/domains/friends/repository/friends_repository.dart';

class SearchUsersUseCase extends UseCase<List<FriendsEntity>, String> {
  SearchUsersUseCase({required FriendsRepository friendsRepository})
      : _friendsRepository = friendsRepository;
  final FriendsRepository _friendsRepository;

  @override
  EitherFunc<List<FriendsEntity>> execute(String userByName) {
    return _friendsRepository.searchUsers(userByName);
  }
}
