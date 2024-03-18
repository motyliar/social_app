class NoticeLogic {
  static bool didIClick(Set<String> idsList, String userId) {
    for (var likes in idsList) {
      if (likes == userId) {
        return true;
      }
    }
    return false;
  }
}
