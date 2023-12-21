import 'package:bloc/bloc.dart';
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:climbapp/domains/friends/usecases/get_friend_usecase.dart';
import 'package:equatable/equatable.dart';

part 'friends_action_event.dart';
part 'friends_action_state.dart';

class FriendsActionBloc extends Bloc<FriendsActionEvent, FriendsActionState> {
  final GetFriendUseCase _getFriendUseCase;
  FriendsActionBloc({required GetFriendUseCase getFriendUseCase})
      : _getFriendUseCase = getFriendUseCase,
        super(const FriendsActionInitial()) {
    on<FetchFriendsListEvent>(_fetchFriends);
  }
  Future<void> _fetchFriends(
      FetchFriendsListEvent event, Emitter<FriendsActionState> emit) async {
    final result = await _getFriendUseCase.execute(event.params);

    result.fold((failure) => emit(FriendsFailure(message: failure.toString())),
        (friends) => emit(FriendsLoaded(friends)));
  }
}
