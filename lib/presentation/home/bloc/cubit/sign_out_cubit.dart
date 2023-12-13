import 'package:bloc/bloc.dart';
import 'package:climbapp/domains/sign_in/usecases/log_out_usecase.dart';
import 'package:equatable/equatable.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit(this._logOutUseCase) : super(SignOutInitial());
  final LogOutUseCase _logOutUseCase;

  void userSignOut() {
    try {
      _logOutUseCase.call();
      emit(SignOutComplete());
    } catch (e) {
      throw Exception(e);
    }
  }
}
