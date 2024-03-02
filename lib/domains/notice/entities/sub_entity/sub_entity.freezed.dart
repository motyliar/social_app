// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContentEntity _$ContentEntityFromJson(Map<String, dynamic> json) {
  return _ContentEntity.fromJson(json);
}

/// @nodoc
mixin _$ContentEntity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentEntityCopyWith<ContentEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentEntityCopyWith<$Res> {
  factory $ContentEntityCopyWith(
          ContentEntity value, $Res Function(ContentEntity) then) =
      _$ContentEntityCopyWithImpl<$Res, ContentEntity>;
  @useResult
  $Res call({String id, String title, String content, int? price});
}

/// @nodoc
class _$ContentEntityCopyWithImpl<$Res, $Val extends ContentEntity>
    implements $ContentEntityCopyWith<$Res> {
  _$ContentEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentEntityImplCopyWith<$Res>
    implements $ContentEntityCopyWith<$Res> {
  factory _$$ContentEntityImplCopyWith(
          _$ContentEntityImpl value, $Res Function(_$ContentEntityImpl) then) =
      __$$ContentEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, String content, int? price});
}

/// @nodoc
class __$$ContentEntityImplCopyWithImpl<$Res>
    extends _$ContentEntityCopyWithImpl<$Res, _$ContentEntityImpl>
    implements _$$ContentEntityImplCopyWith<$Res> {
  __$$ContentEntityImplCopyWithImpl(
      _$ContentEntityImpl _value, $Res Function(_$ContentEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? price = freezed,
  }) {
    return _then(_$ContentEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentEntityImpl implements _ContentEntity {
  const _$ContentEntityImpl(
      {required this.id,
      required this.title,
      required this.content,
      this.price});

  factory _$ContentEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  @override
  final int? price;

  @override
  String toString() {
    return 'ContentEntity(id: $id, title: $title, content: $content, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, content, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentEntityImplCopyWith<_$ContentEntityImpl> get copyWith =>
      __$$ContentEntityImplCopyWithImpl<_$ContentEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentEntityImplToJson(
      this,
    );
  }
}

abstract class _ContentEntity implements ContentEntity {
  const factory _ContentEntity(
      {required final String id,
      required final String title,
      required final String content,
      final int? price}) = _$ContentEntityImpl;

  factory _ContentEntity.fromJson(Map<String, dynamic> json) =
      _$ContentEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  int? get price;
  @override
  @JsonKey(ignore: true)
  _$$ContentEntityImplCopyWith<_$ContentEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentsEntity _$CommentsEntityFromJson(Map<String, dynamic> json) {
  return _CommentsEntity.fromJson(json);
}

/// @nodoc
mixin _$CommentsEntity {
  String get id => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentsEntityCopyWith<CommentsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsEntityCopyWith<$Res> {
  factory $CommentsEntityCopyWith(
          CommentsEntity value, $Res Function(CommentsEntity) then) =
      _$CommentsEntityCopyWithImpl<$Res, CommentsEntity>;
  @useResult
  $Res call(
      {String id,
      String user,
      String userId,
      String content,
      int likes,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$CommentsEntityCopyWithImpl<$Res, $Val extends CommentsEntity>
    implements $CommentsEntityCopyWith<$Res> {
  _$CommentsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? userId = null,
    Object? content = null,
    Object? likes = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentsEntityImplCopyWith<$Res>
    implements $CommentsEntityCopyWith<$Res> {
  factory _$$CommentsEntityImplCopyWith(_$CommentsEntityImpl value,
          $Res Function(_$CommentsEntityImpl) then) =
      __$$CommentsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String user,
      String userId,
      String content,
      int likes,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$CommentsEntityImplCopyWithImpl<$Res>
    extends _$CommentsEntityCopyWithImpl<$Res, _$CommentsEntityImpl>
    implements _$$CommentsEntityImplCopyWith<$Res> {
  __$$CommentsEntityImplCopyWithImpl(
      _$CommentsEntityImpl _value, $Res Function(_$CommentsEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? userId = null,
    Object? content = null,
    Object? likes = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$CommentsEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentsEntityImpl implements _CommentsEntity {
  const _$CommentsEntityImpl(
      {required this.id,
      required this.user,
      required this.userId,
      required this.content,
      required this.likes,
      required this.createdAt,
      required this.updatedAt});

  factory _$CommentsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentsEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String user;
  @override
  final String userId;
  @override
  final String content;
  @override
  final int likes;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'CommentsEntity(id: $id, user: $user, userId: $userId, content: $content, likes: $likes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, user, userId, content, likes, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsEntityImplCopyWith<_$CommentsEntityImpl> get copyWith =>
      __$$CommentsEntityImplCopyWithImpl<_$CommentsEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentsEntityImplToJson(
      this,
    );
  }
}

abstract class _CommentsEntity implements CommentsEntity {
  const factory _CommentsEntity(
      {required final String id,
      required final String user,
      required final String userId,
      required final String content,
      required final int likes,
      required final String createdAt,
      required final String updatedAt}) = _$CommentsEntityImpl;

  factory _CommentsEntity.fromJson(Map<String, dynamic> json) =
      _$CommentsEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get user;
  @override
  String get userId;
  @override
  String get content;
  @override
  int get likes;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$CommentsEntityImplCopyWith<_$CommentsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
