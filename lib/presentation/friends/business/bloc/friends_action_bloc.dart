import 'package:bloc/bloc.dart';
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:climbapp/domains/friends/usecases/add_friend.dart';
import 'package:climbapp/domains/friends/usecases/delete_friend_usecase.dart';
import 'package:climbapp/domains/friends/usecases/get_friend_usecase.dart';
import 'package:climbapp/domains/friends/usecases/search_users_usecase.dart';
import 'package:equatable/equatable.dart';

part 'friends_action_event.dart';
part 'friends_action_state.dart';

class FriendsActionBloc extends Bloc<FriendsActionEvent, FriendsActionState> {
  final GetFriendUseCase _getFriendUseCase;
  final DeleteFriendUseCase _deleteFriendUseCase;
  final AddFriendUseCase _addFriendUseCase;
  final SearchUsersUseCase _searchUsersUseCase;
  FriendsActionBloc(
      {required GetFriendUseCase getFriendUseCase,
      required DeleteFriendUseCase deleteFriendUseCase,
      required AddFriendUseCase addFriendUseCase,
      required SearchUsersUseCase searchUsersUseCase})
      : _getFriendUseCase = getFriendUseCase,
        _deleteFriendUseCase = deleteFriendUseCase,
        _addFriendUseCase = addFriendUseCase,
        _searchUsersUseCase = searchUsersUseCase,
        super(const FriendsActionInitial()) {
    on<FetchFriendsListEvent>(_fetchFriends);
    on<DeleteFriendFromListEvent>(_deleteFriend);
    on<AddFriendEvent>(_addFriend);
    on<SearchForUsersEvent>(_searchUser);
    on<ChangeStateViewEvent>(_changeView);
    on<SearchFromListEvent>(_searchFromList);
  }

  Future<void> _fetchFriends(
      FetchFriendsListEvent event, Emitter<FriendsActionState> emit) async {
    final result = await _getFriendUseCase.execute(event.params);

    result.fold((failure) => emit(FriendsFailure(message: failure.toString())),
        (friends) => emit(FriendsLoaded(friends, true)));
  }

  Future<void> _deleteFriend(
      DeleteFriendFromListEvent event, Emitter<FriendsActionState> emit) async {
    final result = await _deleteFriendUseCase.execute(event.params);

    result.fold(
        (failure) => emit(FriendOperationFailure(message: failure.toString())),
        (data) => emit(FriendsLoaded(state.friends, state.isMyFriend)));
  }

  Future<void> _addFriend(
      AddFriendEvent event, Emitter<FriendsActionState> emit) async {
    final result = await _addFriendUseCase.execute(event.params);
    if (result.isRight()) {
      await _fetchFriends(FetchFriendsListEvent(params: event.params), emit);
    } else {
      emit(FriendsFailure(message: result.toString()));
    }
  }

  Future<void> _searchUser(
      SearchForUsersEvent event, Emitter<FriendsActionState> emit) async {
    await _searchUsersUseCase.execute(event.userByName).then((data) =>
        data.fold(
            (failure) => emit(FriendsFailure(message: failure.toString())),
            (data) => emit(
                FriendsSearchingSuccess(friend: data, false, state.friends))));
  }

  Future<void> _searchFromList(
      SearchFromListEvent event, Emitter<FriendsActionState> emit) async {
    emit(FriendsLoaded(_searchFromMyFriendsList(state.friends, event.value),
        state.isMyFriend));
  }

  List<FriendsEntity> _searchFromMyFriendsList(
      List<FriendsEntity> myFriends, String value) {
    return myFriends
        .where((element) => element.userName.toLowerCase().contains(value))
        .toList();
  }

  void _changeView(
      ChangeStateViewEvent event, Emitter<FriendsActionState> emit) {
    if (state is FriendsLoaded) {
      emit(FriendsSearchingSuccess(
          friend: <FriendsEntity>[], false, state.friends));
    } else {
      emit(FriendsLoaded(state.friends, true));
    }
  }
}
