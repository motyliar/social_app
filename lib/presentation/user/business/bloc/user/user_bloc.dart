import 'package:bloc/bloc.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/domains/user/entities/user_entity.dart';
import 'package:climbapp/domains/user/usecases/get_user_usecase.dart';
import 'package:climbapp/domains/user/usecases/update_user_usecase.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUseCase _getUserUseCase;
  final UpdateUserUseCase _updateUserUserUseCase;

  UserBloc(GetUserUseCase getUserUseCase, UpdateUserUseCase updateUserUseCase)
      : _getUserUseCase = getUserUseCase,
        _updateUserUserUseCase = updateUserUseCase,
        super(UserInitial()) {
    on<LoadUserEvent>(_loadUser);
    on<UpdateUserEvent>(_updateUser);
  }

  Future<void> _loadUser(LoadUserEvent event, Emitter<UserState> emit) async {
    final result = await _getUserUseCase.execute(event.user);

    result.fold(
      (failure) {
        emit(LoadingFailed());
      },
      (user) => emit(
        UserLoaded(user: user, params: event.user),
      ),
    );
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
      print(result.runtimeType);
      print(failure);
      emit(LoadingFailed());
    }, (data) => emit(UserLoaded(user: data, params: state.params)));
  }
}
