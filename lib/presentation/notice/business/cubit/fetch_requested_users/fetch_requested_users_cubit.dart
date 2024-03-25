import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/requests/requests_params.dart';
import 'package:climbapp/domains/requests/entities/requests_entity.dart';
import 'package:climbapp/domains/requests/usecases/get_requested_users.dart';
import 'package:equatable/equatable.dart';

part 'fetch_requested_users_state.dart';

class FetchRequestedUsersCubit extends Cubit<FetchRequestedUsersState> {
  final GetRequestedUseresUseCase _getUsers;
  FetchRequestedUsersCubit({required GetRequestedUseresUseCase getUsers})
      : _getUsers = getUsers,
        super(const FetchRequestedUsersState(users: <RequestsEntity>[]));

  Future<void> fetchUsers(RequestsParams params) async {
    return _handleResponse(params);
  }

  Future<void> _handleResponse(RequestsParams params) async {
    emit(FetchRequestedUsersLoading(users: state.users));
    try {
      return await _sendListForResponse(params)
          .then((users) => emit(FetchRequestedUsersFailed(users: users)));
    } catch (e) {
      emit(const FetchRequestedUsersFailed(users: []));
    }
  }

  Future<List<RequestsEntity>> _sendListForResponse(
      RequestsParams params) async {
    return await _getUsers
        .execute(params)
        .then((response) => response.fold((l) => throw l, (r) => r));
  }
}
