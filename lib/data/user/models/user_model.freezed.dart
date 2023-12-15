// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @HiveField(0)
  String get userAuthID => throw _privateConstructorUsedError;
  @HiveField(1)
  String get userName => throw _privateConstructorUsedError;
  @HiveField(2)
  String get userEmail => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get isAdmin => throw _privateConstructorUsedError;
  @HiveField(4)
  bool get isUser => throw _privateConstructorUsedError;
  @HiveField(5)
  List<String>? get friendsRequest => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get profileAvatar => throw _privateConstructorUsedError;
  @HiveField(7)
  UserDetailsModel? get details => throw _privateConstructorUsedError;
  @HiveField(8)
  List<String>? get userChallengesIDs => throw _privateConstructorUsedError;
  @HiveField(9)
  List<String>? get messages => throw _privateConstructorUsedError;
  @HiveField(10)
  UserPreferencesModel? get preferences => throw _privateConstructorUsedError;
  @HiveField(11)
  List<String>? get friends => throw _privateConstructorUsedError;
  @HiveField(12)
  UserActiveModel get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@HiveField(0) String userAuthID,
      @HiveField(1) String userName,
      @HiveField(2) String userEmail,
      @HiveField(3) bool isAdmin,
      @HiveField(4) bool isUser,
      @HiveField(5) List<String>? friendsRequest,
      @HiveField(6) String? profileAvatar,
      @HiveField(7) UserDetailsModel? details,
      @HiveField(8) List<String>? userChallengesIDs,
      @HiveField(9) List<String>? messages,
      @HiveField(10) UserPreferencesModel? preferences,
      @HiveField(11) List<String>? friends,
      @HiveField(12) UserActiveModel active});

  $UserDetailsModelCopyWith<$Res>? get details;
  $UserPreferencesModelCopyWith<$Res>? get preferences;
  $UserActiveModelCopyWith<$Res> get active;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userAuthID = null,
    Object? userName = null,
    Object? userEmail = null,
    Object? isAdmin = null,
    Object? isUser = null,
    Object? friendsRequest = freezed,
    Object? profileAvatar = freezed,
    Object? details = freezed,
    Object? userChallengesIDs = freezed,
    Object? messages = freezed,
    Object? preferences = freezed,
    Object? friends = freezed,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      userAuthID: null == userAuthID
          ? _value.userAuthID
          : userAuthID // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isUser: null == isUser
          ? _value.isUser
          : isUser // ignore: cast_nullable_to_non_nullable
              as bool,
      friendsRequest: freezed == friendsRequest
          ? _value.friendsRequest
          : friendsRequest // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      profileAvatar: freezed == profileAvatar
          ? _value.profileAvatar
          : profileAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as UserDetailsModel?,
      userChallengesIDs: freezed == userChallengesIDs
          ? _value.userChallengesIDs
          : userChallengesIDs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      preferences: freezed == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as UserPreferencesModel?,
      friends: freezed == friends
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as UserActiveModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDetailsModelCopyWith<$Res>? get details {
    if (_value.details == null) {
      return null;
    }

    return $UserDetailsModelCopyWith<$Res>(_value.details!, (value) {
      return _then(_value.copyWith(details: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserPreferencesModelCopyWith<$Res>? get preferences {
    if (_value.preferences == null) {
      return null;
    }

    return $UserPreferencesModelCopyWith<$Res>(_value.preferences!, (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserActiveModelCopyWith<$Res> get active {
    return $UserActiveModelCopyWith<$Res>(_value.active, (value) {
      return _then(_value.copyWith(active: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String userAuthID,
      @HiveField(1) String userName,
      @HiveField(2) String userEmail,
      @HiveField(3) bool isAdmin,
      @HiveField(4) bool isUser,
      @HiveField(5) List<String>? friendsRequest,
      @HiveField(6) String? profileAvatar,
      @HiveField(7) UserDetailsModel? details,
      @HiveField(8) List<String>? userChallengesIDs,
      @HiveField(9) List<String>? messages,
      @HiveField(10) UserPreferencesModel? preferences,
      @HiveField(11) List<String>? friends,
      @HiveField(12) UserActiveModel active});

  @override
  $UserDetailsModelCopyWith<$Res>? get details;
  @override
  $UserPreferencesModelCopyWith<$Res>? get preferences;
  @override
  $UserActiveModelCopyWith<$Res> get active;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userAuthID = null,
    Object? userName = null,
    Object? userEmail = null,
    Object? isAdmin = null,
    Object? isUser = null,
    Object? friendsRequest = freezed,
    Object? profileAvatar = freezed,
    Object? details = freezed,
    Object? userChallengesIDs = freezed,
    Object? messages = freezed,
    Object? preferences = freezed,
    Object? friends = freezed,
    Object? active = null,
  }) {
    return _then(_$UserModelImpl(
      userAuthID: null == userAuthID
          ? _value.userAuthID
          : userAuthID // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isUser: null == isUser
          ? _value.isUser
          : isUser // ignore: cast_nullable_to_non_nullable
              as bool,
      friendsRequest: freezed == friendsRequest
          ? _value._friendsRequest
          : friendsRequest // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      profileAvatar: freezed == profileAvatar
          ? _value.profileAvatar
          : profileAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as UserDetailsModel?,
      userChallengesIDs: freezed == userChallengesIDs
          ? _value._userChallengesIDs
          : userChallengesIDs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      messages: freezed == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      preferences: freezed == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as UserPreferencesModel?,
      friends: freezed == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as UserActiveModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl(
      {@HiveField(0) required this.userAuthID,
      @HiveField(1) required this.userName,
      @HiveField(2) required this.userEmail,
      @HiveField(3) required this.isAdmin,
      @HiveField(4) required this.isUser,
      @HiveField(5) final List<String>? friendsRequest,
      @HiveField(6) this.profileAvatar,
      @HiveField(7) this.details,
      @HiveField(8) final List<String>? userChallengesIDs,
      @HiveField(9) final List<String>? messages,
      @HiveField(10) this.preferences,
      @HiveField(11) final List<String>? friends,
      @HiveField(12) required this.active})
      : _friendsRequest = friendsRequest,
        _userChallengesIDs = userChallengesIDs,
        _messages = messages,
        _friends = friends,
        super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @HiveField(0)
  final String userAuthID;
  @override
  @HiveField(1)
  final String userName;
  @override
  @HiveField(2)
  final String userEmail;
  @override
  @HiveField(3)
  final bool isAdmin;
  @override
  @HiveField(4)
  final bool isUser;
  final List<String>? _friendsRequest;
  @override
  @HiveField(5)
  List<String>? get friendsRequest {
    final value = _friendsRequest;
    if (value == null) return null;
    if (_friendsRequest is EqualUnmodifiableListView) return _friendsRequest;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(6)
  final String? profileAvatar;
  @override
  @HiveField(7)
  final UserDetailsModel? details;
  final List<String>? _userChallengesIDs;
  @override
  @HiveField(8)
  List<String>? get userChallengesIDs {
    final value = _userChallengesIDs;
    if (value == null) return null;
    if (_userChallengesIDs is EqualUnmodifiableListView)
      return _userChallengesIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _messages;
  @override
  @HiveField(9)
  List<String>? get messages {
    final value = _messages;
    if (value == null) return null;
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(10)
  final UserPreferencesModel? preferences;
  final List<String>? _friends;
  @override
  @HiveField(11)
  List<String>? get friends {
    final value = _friends;
    if (value == null) return null;
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(12)
  final UserActiveModel active;

  @override
  String toString() {
    return 'UserModel(userAuthID: $userAuthID, userName: $userName, userEmail: $userEmail, isAdmin: $isAdmin, isUser: $isUser, friendsRequest: $friendsRequest, profileAvatar: $profileAvatar, details: $details, userChallengesIDs: $userChallengesIDs, messages: $messages, preferences: $preferences, friends: $friends, active: $active)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.userAuthID, userAuthID) ||
                other.userAuthID == userAuthID) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.isUser, isUser) || other.isUser == isUser) &&
            const DeepCollectionEquality()
                .equals(other._friendsRequest, _friendsRequest) &&
            (identical(other.profileAvatar, profileAvatar) ||
                other.profileAvatar == profileAvatar) &&
            (identical(other.details, details) || other.details == details) &&
            const DeepCollectionEquality()
                .equals(other._userChallengesIDs, _userChallengesIDs) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            const DeepCollectionEquality().equals(other._friends, _friends) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userAuthID,
      userName,
      userEmail,
      isAdmin,
      isUser,
      const DeepCollectionEquality().hash(_friendsRequest),
      profileAvatar,
      details,
      const DeepCollectionEquality().hash(_userChallengesIDs),
      const DeepCollectionEquality().hash(_messages),
      preferences,
      const DeepCollectionEquality().hash(_friends),
      active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {@HiveField(0) required final String userAuthID,
      @HiveField(1) required final String userName,
      @HiveField(2) required final String userEmail,
      @HiveField(3) required final bool isAdmin,
      @HiveField(4) required final bool isUser,
      @HiveField(5) final List<String>? friendsRequest,
      @HiveField(6) final String? profileAvatar,
      @HiveField(7) final UserDetailsModel? details,
      @HiveField(8) final List<String>? userChallengesIDs,
      @HiveField(9) final List<String>? messages,
      @HiveField(10) final UserPreferencesModel? preferences,
      @HiveField(11) final List<String>? friends,
      @HiveField(12) required final UserActiveModel active}) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @HiveField(0)
  String get userAuthID;
  @override
  @HiveField(1)
  String get userName;
  @override
  @HiveField(2)
  String get userEmail;
  @override
  @HiveField(3)
  bool get isAdmin;
  @override
  @HiveField(4)
  bool get isUser;
  @override
  @HiveField(5)
  List<String>? get friendsRequest;
  @override
  @HiveField(6)
  String? get profileAvatar;
  @override
  @HiveField(7)
  UserDetailsModel? get details;
  @override
  @HiveField(8)
  List<String>? get userChallengesIDs;
  @override
  @HiveField(9)
  List<String>? get messages;
  @override
  @HiveField(10)
  UserPreferencesModel? get preferences;
  @override
  @HiveField(11)
  List<String>? get friends;
  @override
  @HiveField(12)
  UserActiveModel get active;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
