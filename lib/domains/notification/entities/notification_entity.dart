import 'package:climbapp/domains/notification/entities/sub_entity/notify_type.dart';
import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  const NotificationEntity({
    required this.id,
    required this.userId,
    required this.eventId,
    required this.authorId,
    required this.authorAvatar,
    required this.category,
    required this.isRead,
    required this.createdAt,
  });
  final String id;
  final String userId;
  final String eventId;
  final String authorId;
  final String authorAvatar;
  final NotifyType category;
  final bool isRead;
  final String createdAt;

  @override
  List<Object> get props => [
        id,
        userId,
        eventId,
        authorId,
        authorAvatar,
        category,
        isRead,
        createdAt
      ];
}
