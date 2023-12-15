import 'package:bloc/bloc.dart';


import 'package:climbapp/core/utils/helpers/params.dart';


import 'package:climbapp/domains/user/entities/user_entity.dart';


import 'package:climbapp/domains/user/usecases/get_user_usecase.dart';


import 'package:equatable/equatable.dart';


part 'user_event.dart';


part 'user_state.dart';


class UserBloc extends Bloc<UserEvent, UserState> {

  final GetUserUseCase _getUserUseCase;


  UserBloc(GetUserUseCase getUserUseCase)

      : _getUserUseCase = getUserUseCase,

        super(UserInitial()) {

    on<LoadUserEvent>(_loadUser);

  }


  Future<void> _loadUser(LoadUserEvent event, Emitter<UserState> emit) async {

    final result = await _getUserUseCase.execute(event.user);


    result.fold(

      (failure) {

        print(failure);


        emit(LoadingFailed());

      },

      (user) => emit(

        UserLoaded(user: user, params: event.user),

      ),

    );

  }

}

