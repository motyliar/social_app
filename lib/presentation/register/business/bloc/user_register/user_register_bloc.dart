import 'package:bloc/bloc.dart';


import 'package:climbapp/core/constans/constans.dart';


import 'package:climbapp/domains/register/entites/register_entites.dart';


import 'package:climbapp/domains/register/usecases/create_db_user_usecase.dart';


import 'package:climbapp/domains/register/usecases/create_new_firebase_user.dart';


import 'package:equatable/equatable.dart';


part 'user_register_event.dart';


part 'user_register_state.dart';


class UserRegisterBloc extends Bloc<UserRegisterEvent, UserRegisterState> {

  UserRegisterBloc(

    this._createDBUserUsecase,

    this._createNewFirebaseUserUsecase,

  ) : super(UserRegisterInitial()) {

    on<AddUserToFireBaseEvent>(_addUserToFirebase);


    on<AddUserToMongoDB>(_addUserToMongoDB);

  }


  final CreateDBUserUsecase _createDBUserUsecase;


  final CreateNewFirebaseUserUsecase _createNewFirebaseUserUsecase;


  Future<void> _addUserToFirebase(

    AddUserToFireBaseEvent event,

    Emitter<UserRegisterState> emit,

  ) async {

    final result = await _createNewFirebaseUserUsecase.execute(event.newUser);


    result.fold(

      (exception) {

        if (exception.toString() == kFailure) {

          emit(ServerFailure());

        } else {

          emit(UserRegisterFailure(exceptionMessage: exception.toString()));

        }

      },

      (data) => emit(UserRegisterLoaded(user: data)),

    );


    print(state);

  }


  Future<void> _addUserToMongoDB(

    AddUserToMongoDB event,

    Emitter<UserRegisterState> emit,

  ) async {

    final result = await _createDBUserUsecase.execute(event.newUser);


    result.fold(

      (exception) =>

          emit(UserRegisterFailure(exceptionMessage: exception.toString())),

      (data) => emit(UserRegisterLoaded(user: data)),

    );


    print(state);

  }

}

