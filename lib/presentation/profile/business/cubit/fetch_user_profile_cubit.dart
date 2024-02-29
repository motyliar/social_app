import 'package:bloc/bloc.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/domains/user/entities/user_entity.dart';
import 'package:climbapp/domains/user/usecases/get_user_usecase.dart';
import 'package:equatable/equatable.dart';

part 'fetch_user_profile_state.dart';

class FetchUserProfileCubit extends Cubit<FetchUserProfileState> {
  final GetUserUseCase _getUserUseCase;
  FetchUserProfileCubit({required GetUserUseCase getUserUseCase})
      : _getUserUseCase = getUserUseCase,
        super(FetchUserProfileLoading());

  Future<void> getUserDetails(GetUserParams user) async {
    await _getUserDetails(user);
  }

  Future<void> _getUserDetails(GetUserParams user) async {
    try {
      await _fetchUserFromDB(user)
          .then((data) => emit(FetchUserProfileLoaded(user: data)));
    } on ServerException catch (e) {
      emit(FetchUserProfileError(e.message));
    }
  }

  Future<UserEntity> _fetchUserFromDB(GetUserParams user) async {
    return await _getUserUseCase.execute(user).then((response) =>
        response.fold((l) => throw ServerException(l.toString()), (r) => r));
  }
}
