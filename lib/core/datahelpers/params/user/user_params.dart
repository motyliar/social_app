import 'package:climbapp/core/datahelpers/params/repository_params.dart';
import 'package:climbapp/domains/user/entities/user_entity.dart';

class UpdatingUserParams extends RepositoryParams {
  const UpdatingUserParams({required this.update, super.url});
  final UserUpdateData update;
  @override
  Map<String, dynamic> requestMapBody() => update.createBody();
}

abstract class IUserUpdate {
  Map<String, dynamic> createBody();
}

class UserUpdateData extends IUserUpdate {
  UserUpdateData({
    this.name,
    this.age,
    this.city,
    this.phone,
  });
  final String? name;
  final int? age;
  final String? city;
  final String? phone;

  @override
  Map<String, dynamic> createBody() {
    return {
      name != null ? 'userName' : name!: null,
      "details": {
        age != null ? 'age' : age!: null,
        city != null ? 'city' : city!: null,
        phone != null ? 'phone' : phone!: null,
      }
    };
  }
}

class UserCustomUpdate<T> extends IUserUpdate {
  UserCustomUpdate({required this.updateData, required this.field});
  String field;
  T updateData;

  @override
  Map<String, dynamic> createBody() => {field: updateData};
}
