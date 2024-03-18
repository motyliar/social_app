class NoticeLogic {
  static bool didIClick(List<String> idsList, String userId) {
    for (var likes in idsList) {
      if (likes == userId) {
        return true;
      }
    }
    return false;
  }
}
