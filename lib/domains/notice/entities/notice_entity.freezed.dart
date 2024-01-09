// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NoticeEntity _$NoticeEntityFromJson(Map<String, dynamic> json) {
  return _NoticeEntity.fromJson(json);
}

/// @nodoc
mixin _$NoticeEntity {
  String get id => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  ContentEntity get content => throw _privateConstructorUsedError;
  CommentsEntity get comments => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoticeEntityCopyWith<NoticeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeEntityCopyWith<$Res> {
  factory $NoticeEntityCopyWith(
          NoticeEntity value, $Res Function(NoticeEntity) then) =
      _$NoticeEntityCopyWithImpl<$Res, NoticeEntity>;
  @useResult
  $Res call(
      {String id,
      String author,
      String authorId,
      String category,
      ContentEntity content,
      CommentsEntity comments,
      String createdAt,
      String updatedAt});

  $ContentEntityCopyWith<$Res> get content;
  $CommentsEntityCopyWith<$Res> get comments;
}

/// @nodoc
class _$NoticeEntityCopyWithImpl<$Res, $Val extends NoticeEntity>
    implements $NoticeEntityCopyWith<$Res> {
  _$NoticeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? authorId = null,
    Object? category = null,
    Object? content = null,
    Object? comments = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ContentEntity,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as CommentsEntity,
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

  @override
  @pragma('vm:prefer-inline')
  $ContentEntityCopyWith<$Res> get content {
    return $ContentEntityCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentsEntityCopyWith<$Res> get comments {
    return $CommentsEntityCopyWith<$Res>(_value.comments, (value) {
      return _then(_value.copyWith(comments: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NoticeEntityImplCopyWith<$Res>
    implements $NoticeEntityCopyWith<$Res> {
  factory _$$NoticeEntityImplCopyWith(
          _$NoticeEntityImpl value, $Res Function(_$NoticeEntityImpl) then) =
      __$$NoticeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String author,
      String authorId,
      String category,
      ContentEntity content,
      CommentsEntity comments,
      String createdAt,
      String updatedAt});

  @override
  $ContentEntityCopyWith<$Res> get content;
  @override
  $CommentsEntityCopyWith<$Res> get comments;
}

/// @nodoc
class __$$NoticeEntityImplCopyWithImpl<$Res>
    extends _$NoticeEntityCopyWithImpl<$Res, _$NoticeEntityImpl>
    implements _$$NoticeEntityImplCopyWith<$Res> {
  __$$NoticeEntityImplCopyWithImpl(
      _$NoticeEntityImpl _value, $Res Function(_$NoticeEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? authorId = null,
    Object? category = null,
    Object? content = null,
    Object? comments = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$NoticeEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ContentEntity,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as CommentsEntity,
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
class _$NoticeEntityImpl implements _NoticeEntity {
  const _$NoticeEntityImpl(
      {required this.id,
      required this.author,
      required this.authorId,
      required this.category,
      required this.content,
      required this.comments,
      required this.createdAt,
      required this.updatedAt});

  factory _$NoticeEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticeEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String author;
  @override
  final String authorId;
  @override
  final String category;
  @override
  final ContentEntity content;
  @override
  final CommentsEntity comments;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'NoticeEntity(id: $id, author: $author, authorId: $authorId, category: $category, content: $content, comments: $comments, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, author, authorId, category,
      content, comments, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeEntityImplCopyWith<_$NoticeEntityImpl> get copyWith =>
      __$$NoticeEntityImplCopyWithImpl<_$NoticeEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoticeEntityImplToJson(
      this,
    );
  }
}

abstract class _NoticeEntity implements NoticeEntity {
  const factory _NoticeEntity(
      {required final String id,
      required final String author,
      required final String authorId,
      required final String category,
      required final ContentEntity content,
      required final CommentsEntity comments,
      required final String createdAt,
      required final String updatedAt}) = _$NoticeEntityImpl;

  factory _NoticeEntity.fromJson(Map<String, dynamic> json) =
      _$NoticeEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get author;
  @override
  String get authorId;
  @override
  String get category;
  @override
  ContentEntity get content;
  @override
  CommentsEntity get comments;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$NoticeEntityImplCopyWith<_$NoticeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
