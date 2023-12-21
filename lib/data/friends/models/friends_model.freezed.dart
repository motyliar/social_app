// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friends_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FriendsModel _$FriendsModelFromJson(Map<String, dynamic> json) {
  return _FriendsModel.fromJson(json);
}

/// @nodoc
mixin _$FriendsModel {
  @HiveField(0)
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get userName => throw _privateConstructorUsedError;
  @HiveField(2)
  String get profileAvatar => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get isActive => throw _privateConstructorUsedError;
  @HiveField(4)
  String get lastLoggedIn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendsModelCopyWith<FriendsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendsModelCopyWith<$Res> {
  factory $FriendsModelCopyWith(
          FriendsModel value, $Res Function(FriendsModel) then) =
      _$FriendsModelCopyWithImpl<$Res, FriendsModel>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: '_id') String id,
      @HiveField(1) String userName,
      @HiveField(2) String profileAvatar,
      @HiveField(3) bool isActive,
      @HiveField(4) String lastLoggedIn});
}

/// @nodoc
class _$FriendsModelCopyWithImpl<$Res, $Val extends FriendsModel>
    implements $FriendsModelCopyWith<$Res> {
  _$FriendsModelCopyWithImpl(this._value, this._then);

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
abstract class _$$FriendsModelImplCopyWith<$Res>
    implements $FriendsModelCopyWith<$Res> {
  factory _$$FriendsModelImplCopyWith(
          _$FriendsModelImpl value, $Res Function(_$FriendsModelImpl) then) =
      __$$FriendsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: '_id') String id,
      @HiveField(1) String userName,
      @HiveField(2) String profileAvatar,
      @HiveField(3) bool isActive,
      @HiveField(4) String lastLoggedIn});
}

/// @nodoc
class __$$FriendsModelImplCopyWithImpl<$Res>
    extends _$FriendsModelCopyWithImpl<$Res, _$FriendsModelImpl>
    implements _$$FriendsModelImplCopyWith<$Res> {
  __$$FriendsModelImplCopyWithImpl(
      _$FriendsModelImpl _value, $Res Function(_$FriendsModelImpl) _then)
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
    return _then(_$FriendsModelImpl(
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
class _$FriendsModelImpl extends _FriendsModel {
  const _$FriendsModelImpl(
      {@HiveField(0) @JsonKey(name: '_id') required this.id,
      @HiveField(1) required this.userName,
      @HiveField(2) required this.profileAvatar,
      @HiveField(3) required this.isActive,
      @HiveField(4) required this.lastLoggedIn})
      : super._();

  factory _$FriendsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendsModelImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: '_id')
  final String id;
  @override
  @HiveField(1)
  final String userName;
  @override
  @HiveField(2)
  final String profileAvatar;
  @override
  @HiveField(3)
  final bool isActive;
  @override
  @HiveField(4)
  final String lastLoggedIn;

  @override
  String toString() {
    return 'FriendsModel(id: $id, userName: $userName, profileAvatar: $profileAvatar, isActive: $isActive, lastLoggedIn: $lastLoggedIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendsModelImpl &&
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
  _$$FriendsModelImplCopyWith<_$FriendsModelImpl> get copyWith =>
      __$$FriendsModelImplCopyWithImpl<_$FriendsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendsModelImplToJson(
      this,
    );
  }
}

abstract class _FriendsModel extends FriendsModel {
  const factory _FriendsModel(
      {@HiveField(0) @JsonKey(name: '_id') required final String id,
      @HiveField(1) required final String userName,
      @HiveField(2) required final String profileAvatar,
      @HiveField(3) required final bool isActive,
      @HiveField(4) required final String lastLoggedIn}) = _$FriendsModelImpl;
  const _FriendsModel._() : super._();

  factory _FriendsModel.fromJson(Map<String, dynamic> json) =
      _$FriendsModelImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: '_id')
  String get id;
  @override
  @HiveField(1)
  String get userName;
  @override
  @HiveField(2)
  String get profileAvatar;
  @override
  @HiveField(3)
  bool get isActive;
  @override
  @HiveField(4)
  String get lastLoggedIn;
  @override
  @JsonKey(ignore: true)
  _$$FriendsModelImplCopyWith<_$FriendsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
