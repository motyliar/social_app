const String _nameValue = "name";
const String _check = "isCheck";

class MessageLogic {
  static List<Map> boolCreator(int index) {
    List<Map> newList = [];
    for (var i = 0; i < index; i++) {
      newList.add({"name": i, "isCheck": false});
    }
    return newList;
  }
}
