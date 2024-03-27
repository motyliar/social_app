import 'package:climbapp/core/constans/notify_type_con.dart';
import 'package:climbapp/domains/notification/entities/sub_entity/notify_type.dart';

class TypeDistributor {
  static NotifyType getType(String type, bool isPositive, String author) {
    switch (type) {
      case NotifyTypeCons.newReq:
        return NewRequests(author: author, kind: isPositive);
      case NotifyTypeCons.resolve:
        return RequestResolve(kind: isPositive, author: author);
      default:
        return NewRequests(author: author);
    }
  }
}
