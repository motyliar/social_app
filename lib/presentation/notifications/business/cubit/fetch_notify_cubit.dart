import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/notification/notification.dart';
import 'package:climbapp/domains/notification/entities/notification_entity.dart';
import 'package:climbapp/domains/notification/usecases/delete_notify_usecase.dart';
import 'package:climbapp/domains/notification/usecases/fetch_user_notify_usecase.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'fetch_notify_state.dart';

class FetchNotifyCubit extends Cubit<FetchNotifyState> {
  final FetchUserNotifyUseCase _fetchNotify;
  final DeleteNotifyUseCase _deleteNotify;
  FetchNotifyCubit(
      {required FetchUserNotifyUseCase fetchNotify,
      required DeleteNotifyUseCase deleteNotify})
      : _fetchNotify = fetchNotify,
        _deleteNotify = deleteNotify,
        super(const FetchNotifyState());
  Future<void> getUserNotifications(NotificationParams params) async {
    return await _handlingResponse(params);
  }

  Future<void> deleteUserNotify(NotificationParams params, int index) async {
    return _handlingDeleteResponse(params, index);
  }

  Future<void> _handlingResponse(NotificationParams params) async {
    emit(FetchNotifyLoading(state.notifications));
    try {
      return await _sendRequest(params)
          .then((value) => emit(FetchNotifyState(notifications: value)));
    } catch (e) {
      debugPrint(e.toString());
      emit(FetchNotifyFailed());
    }
  }

  Future<List<NotificationEntity>> _sendRequest(
      NotificationParams params) async {
    return await _fetchNotify.execute(params).then((response) {
      return response.fold(
        (l) => throw l,
        (r) => r,
      );
    });
  }

  Future<void> _handlingDeleteResponse(
      NotificationParams params, int index) async {
    emit(FetchNotifyLoading(state.notifications));
    try {
      final notifications = state.notifications;
      return await _sendDeleteRequest(params, index).then(
        (value) {
          notifications.removeAt(index);
          emit(
            FetchNotifyState(
              notifications: notifications,
            ),
          );
        },
      );
    } catch (e) {
      emit(FetchNotifyFailed());
    }
  }

  Future<void> _sendDeleteRequest(NotificationParams params, int index) async {
    return await _deleteNotify.execute(params).then(
          (resposne) => resposne.fold(
            (l) => throw l,
            (r) => r,
          ),
        );
  }
}
