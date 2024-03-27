part of 'fetch_notify_cubit.dart';

class FetchNotifyState extends Equatable {
  const FetchNotifyState({this.notifications = const <NotificationEntity>[]});
  final List<NotificationEntity> notifications;

  @override
  List<Object> get props => [notifications];
}

final class FetchNotifyLoading extends FetchNotifyState {
  const FetchNotifyLoading(List<NotificationEntity> notification)
      : super(notifications: notification);
}

final class FetchNotifySuccess extends FetchNotifyState {}

final class FetchNotifyFailed extends FetchNotifyState {}
