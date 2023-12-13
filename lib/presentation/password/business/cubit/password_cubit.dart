import 'package:bloc/bloc.dart';


import 'package:climbapp/domains/password/entities/password_entity.dart';


import 'package:climbapp/domains/password/usecases/change_password_usecase.dart';


import 'package:climbapp/domains/password/usecases/new_password_usecase.dart';


import 'package:equatable/equatable.dart';


part 'password_state.dart';


class PasswordCubit extends Cubit<PasswordState> {

  PasswordCubit({

    required ChangePasswordUseCase changePasswordUseCase,

    required ForgotPasswordUseCase forgotPasswordUseCase,

  })  : _changePasswordUseCase = changePasswordUseCase,

        _forgotPasswordUseCase = forgotPasswordUseCase,

        super(PasswordInitial());


  final ChangePasswordUseCase _changePasswordUseCase;


  final ForgotPasswordUseCase _forgotPasswordUseCase;


  /// in login Page function [forgottenPassword] is used to change the user's


  /// password when it will forgotten and can't sign in to app


  Future<void> forgottenPassword(String passwordDetail) async {

    final result = await _forgotPasswordUseCase.call(passwordDetail);


    result.fold(

      (exception) =>

          emit(PasswordFailed(exceptionMessage: exception.toString())),

      (data) => emit(PasswordSuccess()),

    );

  }


  /// The [changePassword] function is used to change the user's password


  ///  in the application from their profile.


  Future<void> changePassword(PasswordEntity detailsPassword) async {

    final result = await _changePasswordUseCase.call(detailsPassword);


    result.fold(

      (exception) {

        emit(PasswordFailed(exceptionMessage: exception.toString()));


        print(exception.toString());

      },

      (data) => emit(PasswordSuccess()),

    );

  }


  /// Void [clearState] is used for clear state when give a value for


  ///  Fluttertoast


  /// That is very important to not duplicate a exception message in UI


  void clearState() {

    emit(const PasswordFailed(exceptionMessage: ''));

  }

}

