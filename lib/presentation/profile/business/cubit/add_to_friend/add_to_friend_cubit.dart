import 'package:bloc/bloc.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/friends/usecases/add_friend.dart';
import 'package:climbapp/domains/friends/usecases/delete_friend_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'add_to_friend_state.dart';

class AddToFriendCubit extends Cubit<AddToFriendState> {
  final AddFriendUseCase _addFriendUseCase;
  final DeleteFriendUseCase _deleteFriendUseCase;
  AddToFriendCubit(
      {required AddFriendUseCase addFriendUseCase,
      required DeleteFriendUseCase deleteFriendUseCase})
      : _addFriendUseCase = addFriendUseCase,
        _deleteFriendUseCase = deleteFriendUseCase,
        super(const AddToFriendState());

  Future<void> addToFriend(GetFriendsParams params) async {
    await _getResponse(params);
  }

  Future<void> deleteFromFriends(GetFriendsParams params) async {
    await _getDeleteResponse(params);
  }

  Future<String> _addToFriend(GetFriendsParams params) async {
    return await _addFriendUseCase.execute(params).then((response) =>
        response.fold((failure) => throw ServerException(failure.toString()),
            (data) => data));
  }

  Future<void> _getResponse(GetFriendsParams params) async {
    try {
      await _addToFriend(params).then(
          (data) => emit(const AddToFriendState(status: FriendStatus.add)));
    } on ServerException catch (e) {
      debugPrint(e.toString());
      emit(AddToFriendFailed());
    }
  }

  Future<void> _getDeleteResponse(GetFriendsParams params) async {
    try {
      await _deleteFromFriends(params).then(
          (data) => emit(const AddToFriendState(status: FriendStatus.delete)));
    } on ServerException catch (e) {
      debugPrint(e.toString());
      emit(AddToFriendFailed());
    }
  }

  Future<String> _deleteFromFriends(GetFriendsParams params) async {
    return await _deleteFriendUseCase.execute(params).then((response) =>
        response.fold((l) => throw ServerException.error(), (data) => data));
  }
}
