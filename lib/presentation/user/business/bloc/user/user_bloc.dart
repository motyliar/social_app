import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/user/user_params.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/domains/user/entities/sub_user_entity.dart';
import 'package:climbapp/domains/user/entities/user_entity.dart';
import 'package:climbapp/domains/user/usecases/get_user_usecase.dart';
import 'package:climbapp/domains/user/usecases/update_user_usecase.dart';
import 'package:climbapp/domains/user/usecases/updating_user_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUseCase _getUserUseCase;
  final UpdateUserUseCase _updateUserUserUseCase;
  final UpdatingUserUseCase _updatingUserUseCase;

  UserBloc(GetUserUseCase getUserUseCase, UpdateUserUseCase updateUserUseCase,
      UpdatingUserUseCase updatingUserUseCase)
      : _getUserUseCase = getUserUseCase,
        _updateUserUserUseCase = updateUserUseCase,
        _updatingUserUseCase = updatingUserUseCase,
        super(const UserInitial()) {
    on<LoadUserEvent>(_loadUser);
    on<UpdateUserEvent>(_updateUser);
    on<UpdatingUser>(_updatingUser);
  }

  Future<void> _loadUser(LoadUserEvent event, Emitter<UserState> emit) async {
    emit(const UserLoading());
    final result = await _getUserUseCase.execute(event.user);

    result.fold((failure) {
      emit(LoadingFailed());
    },
        (user) => {
              debugPrint('to jest pobrany user: $user i ${user.details}'),
              emit(
                UserLoaded(
                  user: user,
                  params: event.user,
                ),
              ),
            });
  }

  Future<void> _updateUser(
      UpdateUserEvent event, Emitter<UserState> emit) async {
    final state = this.state as UserLoaded;
    dynamic result;
    if (event.boolUpdate != null) {
      result = await _updateUserUserUseCase.execute(event.boolUpdate!);
    } else if (event.stringUpdate != null) {
      result = await _updateUserUserUseCase.execute(event.stringUpdate!);
    } else if (event.intUpdate != null) {
      result = await _updateUserUserUseCase.execute(event.intUpdate!);
    }

    result.fold((failure) {
      emit(LoadingFailed());
    }, (data) => emit(UserLoaded(user: data, params: state.params)));
  }

  Future<void> _updatingUser(
      UpdatingUser event, Emitter<UserState> emit) async {
    emit(const UserLoading());
    try {
      final response =
          await _updateResponse(event.params).then((value) => value);
      emit(UserLoaded(user: response));
    } on ServerException catch (e) {
      debugPrint(e.message);
      emit(LoadingFailed());
    }
  }

  Future<UserEntity> _updateResponse(UpdatingUserParams params) async {
    return await _updatingUserUseCase.execute(params).then((response) =>
        response.fold((l) => throw ServerException.error, (r) => r));
  }
}
