import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/notification/notification.dart';
import 'package:climbapp/domains/notification/entities/notification_entity.dart';
import 'package:climbapp/domains/notification/usecases/fetch_user_notify_usecase.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'fetch_notify_state.dart';

class FetchNotifyCubit extends Cubit<FetchNotifyState> {
  final FetchUserNotifyUseCase _fetchNotify;
  FetchNotifyCubit({required FetchUserNotifyUseCase fetchNotify})
      : _fetchNotify = fetchNotify,
        super(const FetchNotifyState());
  Future<void> getUserNotifications(NotificationParams params) async {
    return await _handlingResponse(params);
  }

  Future<void> _handlingResponse(NotificationParams params) async {
    emit(FetchNotifyLoading());
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
      return response.fold((l) => throw l, (r) => r);
    });
  }
}
