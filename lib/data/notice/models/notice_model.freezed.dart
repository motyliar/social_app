// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NoticeModel _$NoticeModelFromJson(Map<String, dynamic> json) {
  return _NoticeModel.fromJson(json);
}

/// @nodoc
mixin _$NoticeModel {
  @HiveField(0)
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get author => throw _privateConstructorUsedError;
  @HiveField(2)
  String get authorId => throw _privateConstructorUsedError;
  @HiveField(3)
  String get category => throw _privateConstructorUsedError;
  @HiveField(4)
  ContentModel get content => throw _privateConstructorUsedError;
  @HiveField(5)
  CommentsModel get comments => throw _privateConstructorUsedError;
  @HiveField(6)
  String get createdAt => throw _privateConstructorUsedError;
  @HiveField(7)
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoticeModelCopyWith<NoticeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeModelCopyWith<$Res> {
  factory $NoticeModelCopyWith(
          NoticeModel value, $Res Function(NoticeModel) then) =
      _$NoticeModelCopyWithImpl<$Res, NoticeModel>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: '_id') String id,
      @HiveField(1) String author,
      @HiveField(2) String authorId,
      @HiveField(3) String category,
      @HiveField(4) ContentModel content,
      @HiveField(5) CommentsModel comments,
      @HiveField(6) String createdAt,
      @HiveField(7) String updatedAt});

  $ContentModelCopyWith<$Res> get content;
  $CommentsModelCopyWith<$Res> get comments;
}

/// @nodoc
class _$NoticeModelCopyWithImpl<$Res, $Val extends NoticeModel>
    implements $NoticeModelCopyWith<$Res> {
  _$NoticeModelCopyWithImpl(this._value, this._then);

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
              as ContentModel,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as CommentsModel,
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
  $ContentModelCopyWith<$Res> get content {
    return $ContentModelCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentsModelCopyWith<$Res> get comments {
    return $CommentsModelCopyWith<$Res>(_value.comments, (value) {
      return _then(_value.copyWith(comments: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NoticeModelImplCopyWith<$Res>
    implements $NoticeModelCopyWith<$Res> {
  factory _$$NoticeModelImplCopyWith(
          _$NoticeModelImpl value, $Res Function(_$NoticeModelImpl) then) =
      __$$NoticeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: '_id') String id,
      @HiveField(1) String author,
      @HiveField(2) String authorId,
      @HiveField(3) String category,
      @HiveField(4) ContentModel content,
      @HiveField(5) CommentsModel comments,
      @HiveField(6) String createdAt,
      @HiveField(7) String updatedAt});

  @override
  $ContentModelCopyWith<$Res> get content;
  @override
  $CommentsModelCopyWith<$Res> get comments;
}

/// @nodoc
class __$$NoticeModelImplCopyWithImpl<$Res>
    extends _$NoticeModelCopyWithImpl<$Res, _$NoticeModelImpl>
    implements _$$NoticeModelImplCopyWith<$Res> {
  __$$NoticeModelImplCopyWithImpl(
      _$NoticeModelImpl _value, $Res Function(_$NoticeModelImpl) _then)
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
    return _then(_$NoticeModelImpl(
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
              as ContentModel,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as CommentsModel,
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
class _$NoticeModelImpl implements _NoticeModel {
  const _$NoticeModelImpl(
      {@HiveField(0) @JsonKey(name: '_id') required this.id,
      @HiveField(1) required this.author,
      @HiveField(2) required this.authorId,
      @HiveField(3) required this.category,
      @HiveField(4) required this.content,
      @HiveField(5) required this.comments,
      @HiveField(6) required this.createdAt,
      @HiveField(7) required this.updatedAt});

  factory _$NoticeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticeModelImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: '_id')
  final String id;
  @override
  @HiveField(1)
  final String author;
  @override
  @HiveField(2)
  final String authorId;
  @override
  @HiveField(3)
  final String category;
  @override
  @HiveField(4)
  final ContentModel content;
  @override
  @HiveField(5)
  final CommentsModel comments;
  @override
  @HiveField(6)
  final String createdAt;
  @override
  @HiveField(7)
  final String updatedAt;

  @override
  String toString() {
    return 'NoticeModel(id: $id, author: $author, authorId: $authorId, category: $category, content: $content, comments: $comments, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeModelImpl &&
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
  _$$NoticeModelImplCopyWith<_$NoticeModelImpl> get copyWith =>
      __$$NoticeModelImplCopyWithImpl<_$NoticeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoticeModelImplToJson(
      this,
    );
  }
}

abstract class _NoticeModel implements NoticeModel {
  const factory _NoticeModel(
      {@HiveField(0) @JsonKey(name: '_id') required final String id,
      @HiveField(1) required final String author,
      @HiveField(2) required final String authorId,
      @HiveField(3) required final String category,
      @HiveField(4) required final ContentModel content,
      @HiveField(5) required final CommentsModel comments,
      @HiveField(6) required final String createdAt,
      @HiveField(7) required final String updatedAt}) = _$NoticeModelImpl;

  factory _NoticeModel.fromJson(Map<String, dynamic> json) =
      _$NoticeModelImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: '_id')
  String get id;
  @override
  @HiveField(1)
  String get author;
  @override
  @HiveField(2)
  String get authorId;
  @override
  @HiveField(3)
  String get category;
  @override
  @HiveField(4)
  ContentModel get content;
  @override
  @HiveField(5)
  CommentsModel get comments;
  @override
  @HiveField(6)
  String get createdAt;
  @override
  @HiveField(7)
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$NoticeModelImplCopyWith<_$NoticeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
