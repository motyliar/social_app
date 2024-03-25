// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'requests_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestsEntity _$RequestsEntityFromJson(Map<String, dynamic> json) {
  return _RequestsEntity.fromJson(json);
}

/// @nodoc
mixin _$RequestsEntity {
  String get id => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestsEntityCopyWith<RequestsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestsEntityCopyWith<$Res> {
  factory $RequestsEntityCopyWith(
          RequestsEntity value, $Res Function(RequestsEntity) then) =
      _$RequestsEntityCopyWithImpl<$Res, RequestsEntity>;
  @useResult
  $Res call({String id, String userName, String avatar});
}

/// @nodoc
class _$RequestsEntityCopyWithImpl<$Res, $Val extends RequestsEntity>
    implements $RequestsEntityCopyWith<$Res> {
  _$RequestsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? avatar = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestsEntityImplCopyWith<$Res>
    implements $RequestsEntityCopyWith<$Res> {
  factory _$$RequestsEntityImplCopyWith(_$RequestsEntityImpl value,
          $Res Function(_$RequestsEntityImpl) then) =
      __$$RequestsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String userName, String avatar});
}

/// @nodoc
class __$$RequestsEntityImplCopyWithImpl<$Res>
    extends _$RequestsEntityCopyWithImpl<$Res, _$RequestsEntityImpl>
    implements _$$RequestsEntityImplCopyWith<$Res> {
  __$$RequestsEntityImplCopyWithImpl(
      _$RequestsEntityImpl _value, $Res Function(_$RequestsEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? avatar = null,
  }) {
    return _then(_$RequestsEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestsEntityImpl implements _RequestsEntity {
  const _$RequestsEntityImpl(
      {required this.id, required this.userName, required this.avatar});

  factory _$RequestsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestsEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String userName;
  @override
  final String avatar;

  @override
  String toString() {
    return 'RequestsEntity(id: $id, userName: $userName, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestsEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userName, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestsEntityImplCopyWith<_$RequestsEntityImpl> get copyWith =>
      __$$RequestsEntityImplCopyWithImpl<_$RequestsEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestsEntityImplToJson(
      this,
    );
  }
}

abstract class _RequestsEntity implements RequestsEntity {
  const factory _RequestsEntity(
      {required final String id,
      required final String userName,
      required final String avatar}) = _$RequestsEntityImpl;

  factory _RequestsEntity.fromJson(Map<String, dynamic> json) =
      _$RequestsEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get userName;
  @override
  String get avatar;
  @override
  @JsonKey(ignore: true)
  _$$RequestsEntityImplCopyWith<_$RequestsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
