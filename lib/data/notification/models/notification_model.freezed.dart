// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return _NotificationModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationModel {
  @HiveField(0)
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'event_id')
  String get eventId => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'author_id')
  String get authorId => throw _privateConstructorUsedError;
  @HiveField(4)
  String get authorAvatar => throw _privateConstructorUsedError;
  @HiveField(5)
  String get authorName => throw _privateConstructorUsedError;
  @HiveField(6)
  String get category => throw _privateConstructorUsedError;
  @HiveField(7)
  bool get isPositive => throw _privateConstructorUsedError;
  @HiveField(8)
  bool get isRead => throw _privateConstructorUsedError;
  @HiveField(9)
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
          NotificationModel value, $Res Function(NotificationModel) then) =
      _$NotificationModelCopyWithImpl<$Res, NotificationModel>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: '_id') String id,
      @HiveField(1) @JsonKey(name: 'user_id') String userId,
      @HiveField(2) @JsonKey(name: 'event_id') String eventId,
      @HiveField(3) @JsonKey(name: 'author_id') String authorId,
      @HiveField(4) String authorAvatar,
      @HiveField(5) String authorName,
      @HiveField(6) String category,
      @HiveField(7) bool isPositive,
      @HiveField(8) bool isRead,
      @HiveField(9) String createdAt});
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res, $Val extends NotificationModel>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? eventId = null,
    Object? authorId = null,
    Object? authorAvatar = null,
    Object? authorName = null,
    Object? category = null,
    Object? isPositive = null,
    Object? isRead = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      authorAvatar: null == authorAvatar
          ? _value.authorAvatar
          : authorAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      isPositive: null == isPositive
          ? _value.isPositive
          : isPositive // ignore: cast_nullable_to_non_nullable
              as bool,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationModelImplCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$$NotificationModelImplCopyWith(_$NotificationModelImpl value,
          $Res Function(_$NotificationModelImpl) then) =
      __$$NotificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: '_id') String id,
      @HiveField(1) @JsonKey(name: 'user_id') String userId,
      @HiveField(2) @JsonKey(name: 'event_id') String eventId,
      @HiveField(3) @JsonKey(name: 'author_id') String authorId,
      @HiveField(4) String authorAvatar,
      @HiveField(5) String authorName,
      @HiveField(6) String category,
      @HiveField(7) bool isPositive,
      @HiveField(8) bool isRead,
      @HiveField(9) String createdAt});
}

/// @nodoc
class __$$NotificationModelImplCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res, _$NotificationModelImpl>
    implements _$$NotificationModelImplCopyWith<$Res> {
  __$$NotificationModelImplCopyWithImpl(_$NotificationModelImpl _value,
      $Res Function(_$NotificationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? eventId = null,
    Object? authorId = null,
    Object? authorAvatar = null,
    Object? authorName = null,
    Object? category = null,
    Object? isPositive = null,
    Object? isRead = null,
    Object? createdAt = null,
  }) {
    return _then(_$NotificationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      authorAvatar: null == authorAvatar
          ? _value.authorAvatar
          : authorAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      isPositive: null == isPositive
          ? _value.isPositive
          : isPositive // ignore: cast_nullable_to_non_nullable
              as bool,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationModelImpl extends _NotificationModel {
  const _$NotificationModelImpl(
      {@HiveField(0) @JsonKey(name: '_id') required this.id,
      @HiveField(1) @JsonKey(name: 'user_id') required this.userId,
      @HiveField(2) @JsonKey(name: 'event_id') required this.eventId,
      @HiveField(3) @JsonKey(name: 'author_id') required this.authorId,
      @HiveField(4) required this.authorAvatar,
      @HiveField(5) required this.authorName,
      @HiveField(6) required this.category,
      @HiveField(7) required this.isPositive,
      @HiveField(8) required this.isRead,
      @HiveField(9) required this.createdAt})
      : super._();

  factory _$NotificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationModelImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: '_id')
  final String id;
  @override
  @HiveField(1)
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @HiveField(2)
  @JsonKey(name: 'event_id')
  final String eventId;
  @override
  @HiveField(3)
  @JsonKey(name: 'author_id')
  final String authorId;
  @override
  @HiveField(4)
  final String authorAvatar;
  @override
  @HiveField(5)
  final String authorName;
  @override
  @HiveField(6)
  final String category;
  @override
  @HiveField(7)
  final bool isPositive;
  @override
  @HiveField(8)
  final bool isRead;
  @override
  @HiveField(9)
  final String createdAt;

  @override
  String toString() {
    return 'NotificationModel(id: $id, userId: $userId, eventId: $eventId, authorId: $authorId, authorAvatar: $authorAvatar, authorName: $authorName, category: $category, isPositive: $isPositive, isRead: $isRead, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.authorAvatar, authorAvatar) ||
                other.authorAvatar == authorAvatar) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isPositive, isPositive) ||
                other.isPositive == isPositive) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, eventId, authorId,
      authorAvatar, authorName, category, isPositive, isRead, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      __$$NotificationModelImplCopyWithImpl<_$NotificationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationModelImplToJson(
      this,
    );
  }
}

abstract class _NotificationModel extends NotificationModel {
  const factory _NotificationModel(
      {@HiveField(0) @JsonKey(name: '_id') required final String id,
      @HiveField(1) @JsonKey(name: 'user_id') required final String userId,
      @HiveField(2) @JsonKey(name: 'event_id') required final String eventId,
      @HiveField(3) @JsonKey(name: 'author_id') required final String authorId,
      @HiveField(4) required final String authorAvatar,
      @HiveField(5) required final String authorName,
      @HiveField(6) required final String category,
      @HiveField(7) required final bool isPositive,
      @HiveField(8) required final bool isRead,
      @HiveField(9) required final String createdAt}) = _$NotificationModelImpl;
  const _NotificationModel._() : super._();

  factory _NotificationModel.fromJson(Map<String, dynamic> json) =
      _$NotificationModelImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: '_id')
  String get id;
  @override
  @HiveField(1)
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @HiveField(2)
  @JsonKey(name: 'event_id')
  String get eventId;
  @override
  @HiveField(3)
  @JsonKey(name: 'author_id')
  String get authorId;
  @override
  @HiveField(4)
  String get authorAvatar;
  @override
  @HiveField(5)
  String get authorName;
  @override
  @HiveField(6)
  String get category;
  @override
  @HiveField(7)
  bool get isPositive;
  @override
  @HiveField(8)
  bool get isRead;
  @override
  @HiveField(9)
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
