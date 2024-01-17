// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friends_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FriendsEntity _$FriendsEntityFromJson(Map<String, dynamic> json) {
  return _FriendsEntity.fromJson(json);
}

/// @nodoc
mixin _$FriendsEntity {
  String get id => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get profileAvatar => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  String get lastLoggedIn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendsEntityCopyWith<FriendsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendsEntityCopyWith<$Res> {
  factory $FriendsEntityCopyWith(
          FriendsEntity value, $Res Function(FriendsEntity) then) =
      _$FriendsEntityCopyWithImpl<$Res, FriendsEntity>;
  @useResult
  $Res call(
      {String id,
      String userName,
      String profileAvatar,
      bool isActive,
      String lastLoggedIn});
}

/// @nodoc
class _$FriendsEntityCopyWithImpl<$Res, $Val extends FriendsEntity>
    implements $FriendsEntityCopyWith<$Res> {
  _$FriendsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? profileAvatar = null,
    Object? isActive = null,
    Object? lastLoggedIn = null,
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
      profileAvatar: null == profileAvatar
          ? _value.profileAvatar
          : profileAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      lastLoggedIn: null == lastLoggedIn
          ? _value.lastLoggedIn
          : lastLoggedIn // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendsEntityImplCopyWith<$Res>
    implements $FriendsEntityCopyWith<$Res> {
  factory _$$FriendsEntityImplCopyWith(
          _$FriendsEntityImpl value, $Res Function(_$FriendsEntityImpl) then) =
      __$$FriendsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userName,
      String profileAvatar,
      bool isActive,
      String lastLoggedIn});
}

/// @nodoc
class __$$FriendsEntityImplCopyWithImpl<$Res>
    extends _$FriendsEntityCopyWithImpl<$Res, _$FriendsEntityImpl>
    implements _$$FriendsEntityImplCopyWith<$Res> {
  __$$FriendsEntityImplCopyWithImpl(
      _$FriendsEntityImpl _value, $Res Function(_$FriendsEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? profileAvatar = null,
    Object? isActive = null,
    Object? lastLoggedIn = null,
  }) {
    return _then(_$FriendsEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      profileAvatar: null == profileAvatar
          ? _value.profileAvatar
          : profileAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      lastLoggedIn: null == lastLoggedIn
          ? _value.lastLoggedIn
          : lastLoggedIn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendsEntityImpl implements _FriendsEntity {
  const _$FriendsEntityImpl(
      {required this.id,
      required this.userName,
      required this.profileAvatar,
      required this.isActive,
      required this.lastLoggedIn});

  factory _$FriendsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendsEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String userName;
  @override
  final String profileAvatar;
  @override
  final bool isActive;
  @override
  final String lastLoggedIn;

  @override
  String toString() {
    return 'FriendsEntity(id: $id, userName: $userName, profileAvatar: $profileAvatar, isActive: $isActive, lastLoggedIn: $lastLoggedIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendsEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.profileAvatar, profileAvatar) ||
                other.profileAvatar == profileAvatar) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.lastLoggedIn, lastLoggedIn) ||
                other.lastLoggedIn == lastLoggedIn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userName, profileAvatar, isActive, lastLoggedIn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendsEntityImplCopyWith<_$FriendsEntityImpl> get copyWith =>
      __$$FriendsEntityImplCopyWithImpl<_$FriendsEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendsEntityImplToJson(
      this,
    );
  }
}

abstract class _FriendsEntity implements FriendsEntity {
  const factory _FriendsEntity(
      {required final String id,
      required final String userName,
      required final String profileAvatar,
      required final bool isActive,
      required final String lastLoggedIn}) = _$FriendsEntityImpl;

  factory _FriendsEntity.fromJson(Map<String, dynamic> json) =
      _$FriendsEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get userName;
  @override
  String get profileAvatar;
  @override
  bool get isActive;
  @override
  String get lastLoggedIn;
  @override
  @JsonKey(ignore: true)
  _$$FriendsEntityImplCopyWith<_$FriendsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
