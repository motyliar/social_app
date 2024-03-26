import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/notification/notification.dart';
import 'package:climbapp/domains/notification/usecases/add_new_notify_usecase.dart';
import 'package:equatable/equatable.dart';

part 'request_resolve_state.dart';

class RequestResolveCubit extends Cubit<RequestResolveState> {
  final AddNewNotifyUseCase _addNotify;
  RequestResolveCubit({required AddNewNotifyUseCase addNotify})
      : _addNotify = addNotify,
        super(const RequestResolveState());

  Future<void> resolveRequest(NotificationParams params) async {
    return _handleResponse(params);
  }

  Future<void> _handleResponse(NotificationParams params) async {
    try {
      return await _sendRequest(params).then(
        (value) => emit(
          RequestResolveSuccess(),
        ),
      );
    } catch (e) {
      emit(RequestResolveFailed());
    }
  }

  Future<void> _sendRequest(NotificationParams params) async {
    return await _addNotify.execute(params).then((response) {
      response.fold((l) => throw l, (r) => r);
    });
  }
}
