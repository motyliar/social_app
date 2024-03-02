// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserPreferencesModel _$UserPreferencesModelFromJson(Map<String, dynamic> json) {
  return _UserPreferencesModel.fromJson(json);
}

/// @nodoc
mixin _$UserPreferencesModel {
  @HiveField(0)
  bool? get mode => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get language => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPreferencesModelCopyWith<UserPreferencesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesModelCopyWith<$Res> {
  factory $UserPreferencesModelCopyWith(UserPreferencesModel value,
          $Res Function(UserPreferencesModel) then) =
      _$UserPreferencesModelCopyWithImpl<$Res, UserPreferencesModel>;
  @useResult
  $Res call({@HiveField(0) bool? mode, @HiveField(1) String? language});
}

/// @nodoc
class _$UserPreferencesModelCopyWithImpl<$Res,
        $Val extends UserPreferencesModel>
    implements $UserPreferencesModelCopyWith<$Res> {
  _$UserPreferencesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = freezed,
    Object? language = freezed,
  }) {
    return _then(_value.copyWith(
      mode: freezed == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as bool?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPreferencesModelImplCopyWith<$Res>
    implements $UserPreferencesModelCopyWith<$Res> {
  factory _$$UserPreferencesModelImplCopyWith(_$UserPreferencesModelImpl value,
          $Res Function(_$UserPreferencesModelImpl) then) =
      __$$UserPreferencesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) bool? mode, @HiveField(1) String? language});
}

/// @nodoc
class __$$UserPreferencesModelImplCopyWithImpl<$Res>
    extends _$UserPreferencesModelCopyWithImpl<$Res, _$UserPreferencesModelImpl>
    implements _$$UserPreferencesModelImplCopyWith<$Res> {
  __$$UserPreferencesModelImplCopyWithImpl(_$UserPreferencesModelImpl _value,
      $Res Function(_$UserPreferencesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = freezed,
    Object? language = freezed,
  }) {
    return _then(_$UserPreferencesModelImpl(
      mode: freezed == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as bool?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPreferencesModelImpl implements _UserPreferencesModel {
  const _$UserPreferencesModelImpl(
      {@HiveField(0) this.mode, @HiveField(1) this.language});

  factory _$UserPreferencesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPreferencesModelImplFromJson(json);

  @override
  @HiveField(0)
  final bool? mode;
  @override
  @HiveField(1)
  final String? language;

  @override
  String toString() {
    return 'UserPreferencesModel(mode: $mode, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPreferencesModelImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mode, language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPreferencesModelImplCopyWith<_$UserPreferencesModelImpl>
      get copyWith =>
          __$$UserPreferencesModelImplCopyWithImpl<_$UserPreferencesModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPreferencesModelImplToJson(
      this,
    );
  }
}

abstract class _UserPreferencesModel implements UserPreferencesModel {
  const factory _UserPreferencesModel(
      {@HiveField(0) final bool? mode,
      @HiveField(1) final String? language}) = _$UserPreferencesModelImpl;

  factory _UserPreferencesModel.fromJson(Map<String, dynamic> json) =
      _$UserPreferencesModelImpl.fromJson;

  @override
  @HiveField(0)
  bool? get mode;
  @override
  @HiveField(1)
  String? get language;
  @override
  @JsonKey(ignore: true)
  _$$UserPreferencesModelImplCopyWith<_$UserPreferencesModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserDetailsModel _$UserDetailsModelFromJson(Map<String, dynamic> json) {
  return _UserDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$UserDetailsModel {
  @HiveField(0)
  int? get age => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get gender => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDetailsModelCopyWith<UserDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsModelCopyWith<$Res> {
  factory $UserDetailsModelCopyWith(
          UserDetailsModel value, $Res Function(UserDetailsModel) then) =
      _$UserDetailsModelCopyWithImpl<$Res, UserDetailsModel>;
  @useResult
  $Res call(
      {@HiveField(0) int? age,
      @HiveField(1) String? gender,
      @HiveField(2) String? phone});
}

/// @nodoc
class _$UserDetailsModelCopyWithImpl<$Res, $Val extends UserDetailsModel>
    implements $UserDetailsModelCopyWith<$Res> {
  _$UserDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? age = freezed,
    Object? gender = freezed,
    Object? phone = freezed,
  }) {
    return _then(_value.copyWith(
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDetailsModelImplCopyWith<$Res>
    implements $UserDetailsModelCopyWith<$Res> {
  factory _$$UserDetailsModelImplCopyWith(_$UserDetailsModelImpl value,
          $Res Function(_$UserDetailsModelImpl) then) =
      __$$UserDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? age,
      @HiveField(1) String? gender,
      @HiveField(2) String? phone});
}

/// @nodoc
class __$$UserDetailsModelImplCopyWithImpl<$Res>
    extends _$UserDetailsModelCopyWithImpl<$Res, _$UserDetailsModelImpl>
    implements _$$UserDetailsModelImplCopyWith<$Res> {
  __$$UserDetailsModelImplCopyWithImpl(_$UserDetailsModelImpl _value,
      $Res Function(_$UserDetailsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? age = freezed,
    Object? gender = freezed,
    Object? phone = freezed,
  }) {
    return _then(_$UserDetailsModelImpl(
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDetailsModelImpl implements _UserDetailsModel {
  const _$UserDetailsModelImpl(
      {@HiveField(0) this.age,
      @HiveField(1) this.gender,
      @HiveField(2) this.phone});

  factory _$UserDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDetailsModelImplFromJson(json);

  @override
  @HiveField(0)
  final int? age;
  @override
  @HiveField(1)
  final String? gender;
  @override
  @HiveField(2)
  final String? phone;

  @override
  String toString() {
    return 'UserDetailsModel(age: $age, gender: $gender, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetailsModelImpl &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, age, gender, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailsModelImplCopyWith<_$UserDetailsModelImpl> get copyWith =>
      __$$UserDetailsModelImplCopyWithImpl<_$UserDetailsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _UserDetailsModel implements UserDetailsModel {
  const factory _UserDetailsModel(
      {@HiveField(0) final int? age,
      @HiveField(1) final String? gender,
      @HiveField(2) final String? phone}) = _$UserDetailsModelImpl;

  factory _UserDetailsModel.fromJson(Map<String, dynamic> json) =
      _$UserDetailsModelImpl.fromJson;

  @override
  @HiveField(0)
  int? get age;
  @override
  @HiveField(1)
  String? get gender;
  @override
  @HiveField(2)
  String? get phone;
  @override
  @JsonKey(ignore: true)
  _$$UserDetailsModelImplCopyWith<_$UserDetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserFriendsModel _$UserFriendsModelFromJson(Map<String, dynamic> json) {
  return _UserFriendsModel.fromJson(json);
}

/// @nodoc
mixin _$UserFriendsModel {
  String get userId => throw _privateConstructorUsedError;
  String get userAvatar => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserFriendsModelCopyWith<UserFriendsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFriendsModelCopyWith<$Res> {
  factory $UserFriendsModelCopyWith(
          UserFriendsModel value, $Res Function(UserFriendsModel) then) =
      _$UserFriendsModelCopyWithImpl<$Res, UserFriendsModel>;
  @useResult
  $Res call({String userId, String userAvatar, String userName});
}

/// @nodoc
class _$UserFriendsModelCopyWithImpl<$Res, $Val extends UserFriendsModel>
    implements $UserFriendsModelCopyWith<$Res> {
  _$UserFriendsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userAvatar = null,
    Object? userName = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userAvatar: null == userAvatar
          ? _value.userAvatar
          : userAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserFriendsModelImplCopyWith<$Res>
    implements $UserFriendsModelCopyWith<$Res> {
  factory _$$UserFriendsModelImplCopyWith(_$UserFriendsModelImpl value,
          $Res Function(_$UserFriendsModelImpl) then) =
      __$$UserFriendsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String userAvatar, String userName});
}

/// @nodoc
class __$$UserFriendsModelImplCopyWithImpl<$Res>
    extends _$UserFriendsModelCopyWithImpl<$Res, _$UserFriendsModelImpl>
    implements _$$UserFriendsModelImplCopyWith<$Res> {
  __$$UserFriendsModelImplCopyWithImpl(_$UserFriendsModelImpl _value,
      $Res Function(_$UserFriendsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userAvatar = null,
    Object? userName = null,
  }) {
    return _then(_$UserFriendsModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userAvatar: null == userAvatar
          ? _value.userAvatar
          : userAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserFriendsModelImpl implements _UserFriendsModel {
  const _$UserFriendsModelImpl(
      {required this.userId, required this.userAvatar, required this.userName});

  factory _$UserFriendsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserFriendsModelImplFromJson(json);

  @override
  final String userId;
  @override
  final String userAvatar;
  @override
  final String userName;

  @override
  String toString() {
    return 'UserFriendsModel(userId: $userId, userAvatar: $userAvatar, userName: $userName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserFriendsModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userAvatar, userAvatar) ||
                other.userAvatar == userAvatar) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, userAvatar, userName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserFriendsModelImplCopyWith<_$UserFriendsModelImpl> get copyWith =>
      __$$UserFriendsModelImplCopyWithImpl<_$UserFriendsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserFriendsModelImplToJson(
      this,
    );
  }
}

abstract class _UserFriendsModel implements UserFriendsModel {
  const factory _UserFriendsModel(
      {required final String userId,
      required final String userAvatar,
      required final String userName}) = _$UserFriendsModelImpl;

  factory _UserFriendsModel.fromJson(Map<String, dynamic> json) =
      _$UserFriendsModelImpl.fromJson;

  @override
  String get userId;
  @override
  String get userAvatar;
  @override
  String get userName;
  @override
  @JsonKey(ignore: true)
  _$$UserFriendsModelImplCopyWith<_$UserFriendsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserActiveModel _$UserActiveModelFromJson(Map<String, dynamic> json) {
  return _UserActiveModel.fromJson(json);
}

/// @nodoc
mixin _$UserActiveModel {
  @HiveField(0)
  bool get isActive => throw _privateConstructorUsedError;
  @HiveField(1)
  String get lastLoggedIn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserActiveModelCopyWith<UserActiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserActiveModelCopyWith<$Res> {
  factory $UserActiveModelCopyWith(
          UserActiveModel value, $Res Function(UserActiveModel) then) =
      _$UserActiveModelCopyWithImpl<$Res, UserActiveModel>;
  @useResult
  $Res call({@HiveField(0) bool isActive, @HiveField(1) String lastLoggedIn});
}

/// @nodoc
class _$UserActiveModelCopyWithImpl<$Res, $Val extends UserActiveModel>
    implements $UserActiveModelCopyWith<$Res> {
  _$UserActiveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isActive = null,
    Object? lastLoggedIn = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$UserActiveModelImplCopyWith<$Res>
    implements $UserActiveModelCopyWith<$Res> {
  factory _$$UserActiveModelImplCopyWith(_$UserActiveModelImpl value,
          $Res Function(_$UserActiveModelImpl) then) =
      __$$UserActiveModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) bool isActive, @HiveField(1) String lastLoggedIn});
}

/// @nodoc
class __$$UserActiveModelImplCopyWithImpl<$Res>
    extends _$UserActiveModelCopyWithImpl<$Res, _$UserActiveModelImpl>
    implements _$$UserActiveModelImplCopyWith<$Res> {
  __$$UserActiveModelImplCopyWithImpl(
      _$UserActiveModelImpl _value, $Res Function(_$UserActiveModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isActive = null,
    Object? lastLoggedIn = null,
  }) {
    return _then(_$UserActiveModelImpl(
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
class _$UserActiveModelImpl implements _UserActiveModel {
  const _$UserActiveModelImpl(
      {@HiveField(0) this.isActive = false,
      @HiveField(1) this.lastLoggedIn = '0000 00 00'});

  factory _$UserActiveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserActiveModelImplFromJson(json);

  @override
  @JsonKey()
  @HiveField(0)
  final bool isActive;
  @override
  @JsonKey()
  @HiveField(1)
  final String lastLoggedIn;

  @override
  String toString() {
    return 'UserActiveModel(isActive: $isActive, lastLoggedIn: $lastLoggedIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserActiveModelImpl &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.lastLoggedIn, lastLoggedIn) ||
                other.lastLoggedIn == lastLoggedIn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isActive, lastLoggedIn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserActiveModelImplCopyWith<_$UserActiveModelImpl> get copyWith =>
      __$$UserActiveModelImplCopyWithImpl<_$UserActiveModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserActiveModelImplToJson(
      this,
    );
  }
}

abstract class _UserActiveModel implements UserActiveModel {
  const factory _UserActiveModel(
      {@HiveField(0) final bool isActive,
      @HiveField(1) final String lastLoggedIn}) = _$UserActiveModelImpl;

  factory _UserActiveModel.fromJson(Map<String, dynamic> json) =
      _$UserActiveModelImpl.fromJson;

  @override
  @HiveField(0)
  bool get isActive;
  @override
  @HiveField(1)
  String get lastLoggedIn;
  @override
  @JsonKey(ignore: true)
  _$$UserActiveModelImplCopyWith<_$UserActiveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
