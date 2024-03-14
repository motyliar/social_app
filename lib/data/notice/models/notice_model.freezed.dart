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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  List<CommentsModel>? get comments => throw _privateConstructorUsedError;
  @HiveField(6)
  String get createdAt => throw _privateConstructorUsedError;
  @HiveField(7)
  String get updatedAt => throw _privateConstructorUsedError;
  @HiveField(8)
  String get avatar => throw _privateConstructorUsedError;
  @HiveField(9)
  String get type => throw _privateConstructorUsedError;
  @HiveField(10)
  List<String>? get requests => throw _privateConstructorUsedError;
  @HiveField(11)
  List<String>? get interested => throw _privateConstructorUsedError;
  @HiveField(12)
  String? get image => throw _privateConstructorUsedError;

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
      @HiveField(5) List<CommentsModel>? comments,
      @HiveField(6) String createdAt,
      @HiveField(7) String updatedAt,
      @HiveField(8) String avatar,
      @HiveField(9) String type,
      @HiveField(10) List<String>? requests,
      @HiveField(11) List<String>? interested,
      @HiveField(12) String? image});

  $ContentModelCopyWith<$Res> get content;
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
    Object? comments = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? avatar = null,
    Object? type = null,
    Object? requests = freezed,
    Object? interested = freezed,
    Object? image = freezed,
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
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentsModel>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      requests: freezed == requests
          ? _value.requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      interested: freezed == interested
          ? _value.interested
          : interested // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContentModelCopyWith<$Res> get content {
    return $ContentModelCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
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
      @HiveField(5) List<CommentsModel>? comments,
      @HiveField(6) String createdAt,
      @HiveField(7) String updatedAt,
      @HiveField(8) String avatar,
      @HiveField(9) String type,
      @HiveField(10) List<String>? requests,
      @HiveField(11) List<String>? interested,
      @HiveField(12) String? image});

  @override
  $ContentModelCopyWith<$Res> get content;
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
    Object? comments = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? avatar = null,
    Object? type = null,
    Object? requests = freezed,
    Object? interested = freezed,
    Object? image = freezed,
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
      comments: freezed == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentsModel>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      requests: freezed == requests
          ? _value._requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      interested: freezed == interested
          ? _value._interested
          : interested // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoticeModelImpl extends _NoticeModel {
  const _$NoticeModelImpl(
      {@HiveField(0) @JsonKey(name: '_id') required this.id,
      @HiveField(1) required this.author,
      @HiveField(2) required this.authorId,
      @HiveField(3) required this.category,
      @HiveField(4) required this.content,
      @HiveField(5) final List<CommentsModel>? comments,
      @HiveField(6) required this.createdAt,
      @HiveField(7) required this.updatedAt,
      @HiveField(8) required this.avatar,
      @HiveField(9) required this.type,
      @HiveField(10) final List<String>? requests,
      @HiveField(11) final List<String>? interested,
      @HiveField(12) this.image})
      : _comments = comments,
        _requests = requests,
        _interested = interested,
        super._();

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
  final List<CommentsModel>? _comments;
  @override
  @HiveField(5)
  List<CommentsModel>? get comments {
    final value = _comments;
    if (value == null) return null;
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(6)
  final String createdAt;
  @override
  @HiveField(7)
  final String updatedAt;
  @override
  @HiveField(8)
  final String avatar;
  @override
  @HiveField(9)
  final String type;
  final List<String>? _requests;
  @override
  @HiveField(10)
  List<String>? get requests {
    final value = _requests;
    if (value == null) return null;
    if (_requests is EqualUnmodifiableListView) return _requests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _interested;
  @override
  @HiveField(11)
  List<String>? get interested {
    final value = _interested;
    if (value == null) return null;
    if (_interested is EqualUnmodifiableListView) return _interested;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(12)
  final String? image;

  @override
  String toString() {
    return 'NoticeModel(id: $id, author: $author, authorId: $authorId, category: $category, content: $content, comments: $comments, createdAt: $createdAt, updatedAt: $updatedAt, avatar: $avatar, type: $type, requests: $requests, interested: $interested, image: $image)';
  }

  @override
  bool operator ==(Object other) {
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
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._requests, _requests) &&
            const DeepCollectionEquality()
                .equals(other._interested, _interested) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      author,
      authorId,
      category,
      content,
      const DeepCollectionEquality().hash(_comments),
      createdAt,
      updatedAt,
      avatar,
      type,
      const DeepCollectionEquality().hash(_requests),
      const DeepCollectionEquality().hash(_interested),
      image);

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

abstract class _NoticeModel extends NoticeModel {
  const factory _NoticeModel(
      {@HiveField(0) @JsonKey(name: '_id') required final String id,
      @HiveField(1) required final String author,
      @HiveField(2) required final String authorId,
      @HiveField(3) required final String category,
      @HiveField(4) required final ContentModel content,
      @HiveField(5) final List<CommentsModel>? comments,
      @HiveField(6) required final String createdAt,
      @HiveField(7) required final String updatedAt,
      @HiveField(8) required final String avatar,
      @HiveField(9) required final String type,
      @HiveField(10) final List<String>? requests,
      @HiveField(11) final List<String>? interested,
      @HiveField(12) final String? image}) = _$NoticeModelImpl;
  const _NoticeModel._() : super._();

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
  List<CommentsModel>? get comments;
  @override
  @HiveField(6)
  String get createdAt;
  @override
  @HiveField(7)
  String get updatedAt;
  @override
  @HiveField(8)
  String get avatar;
  @override
  @HiveField(9)
  String get type;
  @override
  @HiveField(10)
  List<String>? get requests;
  @override
  @HiveField(11)
  List<String>? get interested;
  @override
  @HiveField(12)
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$NoticeModelImplCopyWith<_$NoticeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
