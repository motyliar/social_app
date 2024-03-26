class NoticeLogic {
  static Map<String, dynamic> createResolveMap({
    required bool isPositive,
    required String userId,
    required String event,
    required String author,
    required String avatar,
    required String category,
    required String authorName,
  }) {
    return {
      "user_id": userId,
      "event_id": event,
      "author_id": author,
      "authorAvatar": avatar,
      "authorName": authorName,
      "category": category,
      "isPositive": isPositive
    };
  }
}
