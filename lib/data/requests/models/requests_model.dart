import 'package:climbapp/domains/requests/entities/requests_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'requests_model.freezed.dart';
part 'requests_model.g.dart';

@freezed
class RequestsModel with _$RequestsModel {
  const RequestsModel._();
  const factory RequestsModel({
    required String id,
    required String userName,
    required String avatar,
  }) = _RequestsModel;
  factory RequestsModel.fromJson(Map<String, dynamic> json) =>
      _$RequestsModelFromJson(json);

  RequestsEntity toEntity() =>
      RequestsEntity(id: id, userName: userName, avatar: avatar);
}
