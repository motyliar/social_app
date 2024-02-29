import 'package:bloc/bloc.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/friends/usecases/add_friend.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'add_to_friend_state.dart';

class AddToFriendCubit extends Cubit<AddToFriendState> {
  final AddFriendUseCase _addFriendUseCase;
  AddToFriendCubit({required AddFriendUseCase addFriendUseCase})
      : _addFriendUseCase = addFriendUseCase,
        super(AddToFriendInitial());

  Future<void> addToFriend(GetFriendsParams params) async {
    await _getResponse(params);
  }

  Future<String> _addToFriend(GetFriendsParams params) async {
    return await _addFriendUseCase.execute(params).then((response) =>
        response.fold((failure) => throw ServerException(failure.toString()),
            (data) => data));
  }

  Future<void> _getResponse(GetFriendsParams params) async {
    try {
      await _addToFriend(params).then((data) => emit(AddToFriendSuccess()));
    } on ServerException catch (e) {
      debugPrint(e.toString());
      emit(AddToFriendFailed());
    }
  }
}
