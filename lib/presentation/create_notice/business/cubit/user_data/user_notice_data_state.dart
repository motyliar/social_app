part of 'user_notice_data_cubit.dart';

class UserNoticeDataState extends Equatable {
  const UserNoticeDataState(
      {this.category = NoticeCategory.general,
      this.type = ActionType.partner,
      required this.date});
  final NoticeCategory category;
  final ActionType type;
  final String date;

  UserNoticeDataState copyWith(
          {NoticeCategory? category, ActionType? type, String? date}) =>
      UserNoticeDataState(
          date: date ?? this.date,
          category: category ?? this.category,
          type: type ?? this.type);

  @override
  List<Object> get props => [category, type, date];
}
