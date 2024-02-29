import 'package:bloc/bloc.dart';

import 'package:climbapp/core/constans/constans.dart';
import 'package:climbapp/core/datahelpers/params/auth/logout.dart';

import 'package:climbapp/core/utils/helpers/params.dart';

import 'package:climbapp/domains/sign_in/entities/sign_in_entity.dart';

import 'package:climbapp/domains/sign_in/usecases/catch_user_token_usecase.dart';

import 'package:climbapp/domains/sign_in/usecases/log_out_usecase.dart';

import 'package:climbapp/domains/sign_in/usecases/sign_in_usecase.dart';

import 'package:equatable/equatable.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required SignInUseCase signInUseCase,
    required LogOutUseCase logOutUseCase,
    required CatchUserTokenUsecase catchUserTokenUsecase,
  })  : _signInUseCase = signInUseCase,
        _logOutUseCase = logOutUseCase,
        _catchUserTokenUsecase = catchUserTokenUsecase,
        super(SignInInitial()) {
    on<SignInProcess>(_signInProcess);
    on<LogOutEvent>(_logOut);
    on<CatchUserTokenFromMongoDB>(_catchToken);
    on<SignInInitLoadingEvent>(_initEvent);
  }

  final SignInUseCase _signInUseCase;

  final LogOutUseCase _logOutUseCase;

  final CatchUserTokenUsecase _catchUserTokenUsecase;

  Future<void> _signInProcess(
    SignInProcess event,
    Emitter<SignInState> emit,
  ) async {
    final result = await _signInUseCase.execute(event.user);

    result.fold(
      (exceptions) {
        if (exceptions.toString() == kFailure) {
          emit(const SignInFailed(exceptionMessage: kServerOffline));
        }

        emit(SignInFailed(exceptionMessage: exceptions.toString()));
      },
      (userId) => emit(SignInSuccess(user: userId)),
    );
  }

  Future<void> _logOut(LogOutEvent event, Emitter<SignInState> emit) async {
    try {
      await _logOutUseCase.execute(event.params);

      emit(SignInInitial());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> _catchToken(
    CatchUserTokenFromMongoDB event,
    Emitter<SignInState> emit,
  ) async {
    final result = await _catchUserTokenUsecase.call(event.user);

    result.fold(
      (exception) => emit(SignInFailed(exceptionMessage: exception.toString())),
      (data) => emit(
        SignInToMongoDB(
          userParams: GetUserParams(token: data.token, userId: data.userID),
        ),
      ),
    );
  }

  void _initEvent(SignInInitLoadingEvent event, Emitter<SignInState> emit) {
    emit(SignInInitial());
  }
}
