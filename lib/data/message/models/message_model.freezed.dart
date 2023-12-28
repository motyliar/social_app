// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return _MessageModel.fromJson(json);
}

/// @nodoc
mixin _$MessageModel {
  @HiveField(0)
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get to => throw _privateConstructorUsedError;
  @HiveField(2)
  String get from => throw _privateConstructorUsedError;
  @HiveField(3)
  String get sender => throw _privateConstructorUsedError;
  @HiveField(4)
  String get recipient => throw _privateConstructorUsedError;
  @HiveField(5)
  String get subject => throw _privateConstructorUsedError;
  @HiveField(6)
  String get content => throw _privateConstructorUsedError;
  @HiveField(7)
  bool get isRead => throw _privateConstructorUsedError;
  @HiveField(8)
  bool get isReply => throw _privateConstructorUsedError;
  @HiveField(9)
  String get createdAt => throw _privateConstructorUsedError;
  @HiveField(10)
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageModelCopyWith<MessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageModelCopyWith<$Res> {
  factory $MessageModelCopyWith(
          MessageModel value, $Res Function(MessageModel) then) =
      _$MessageModelCopyWithImpl<$Res, MessageModel>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "_id") String id,
      @HiveField(1) String to,
      @HiveField(2) String from,
      @HiveField(3) String sender,
      @HiveField(4) String recipient,
      @HiveField(5) String subject,
      @HiveField(6) String content,
      @HiveField(7) bool isRead,
      @HiveField(8) bool isReply,
      @HiveField(9) String createdAt,
      @HiveField(10) String updatedAt});
}

/// @nodoc
class _$MessageModelCopyWithImpl<$Res, $Val extends MessageModel>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? to = null,
    Object? from = null,
    Object? sender = null,
    Object? recipient = null,
    Object? subject = null,
    Object? content = null,
    Object? isRead = null,
    Object? isReply = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      isReply: null == isReply
          ? _value.isReply
          : isReply // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$MessageModelImplCopyWith<$Res>
    implements $MessageModelCopyWith<$Res> {
  factory _$$MessageModelImplCopyWith(
          _$MessageModelImpl value, $Res Function(_$MessageModelImpl) then) =
      __$$MessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "_id") String id,
      @HiveField(1) String to,
      @HiveField(2) String from,
      @HiveField(3) String sender,
      @HiveField(4) String recipient,
      @HiveField(5) String subject,
      @HiveField(6) String content,
      @HiveField(7) bool isRead,
      @HiveField(8) bool isReply,
      @HiveField(9) String createdAt,
      @HiveField(10) String updatedAt});
}

/// @nodoc
class __$$MessageModelImplCopyWithImpl<$Res>
    extends _$MessageModelCopyWithImpl<$Res, _$MessageModelImpl>
    implements _$$MessageModelImplCopyWith<$Res> {
  __$$MessageModelImplCopyWithImpl(
      _$MessageModelImpl _value, $Res Function(_$MessageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? to = null,
    Object? from = null,
    Object? sender = null,
    Object? recipient = null,
    Object? subject = null,
    Object? content = null,
    Object? isRead = null,
    Object? isReply = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$MessageModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      isReply: null == isReply
          ? _value.isReply
          : isReply // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$MessageModelImpl extends _MessageModel {
  const _$MessageModelImpl(
      {@HiveField(0) @JsonKey(name: "_id") required this.id,
      @HiveField(1) required this.to,
      @HiveField(2) required this.from,
      @HiveField(3) required this.sender,
      @HiveField(4) required this.recipient,
      @HiveField(5) required this.subject,
      @HiveField(6) required this.content,
      @HiveField(7) required this.isRead,
      @HiveField(8) required this.isReply,
      @HiveField(9) required this.createdAt,
      @HiveField(10) required this.updatedAt})
      : super._();

  factory _$MessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageModelImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "_id")
  final String id;
  @override
  @HiveField(1)
  final String to;
  @override
  @HiveField(2)
  final String from;
  @override
  @HiveField(3)
  final String sender;
  @override
  @HiveField(4)
  final String recipient;
  @override
  @HiveField(5)
  final String subject;
  @override
  @HiveField(6)
  final String content;
  @override
  @HiveField(7)
  final bool isRead;
  @override
  @HiveField(8)
  final bool isReply;
  @override
  @HiveField(9)
  final String createdAt;
  @override
  @HiveField(10)
  final String updatedAt;

  @override
  String toString() {
    return 'MessageModel(id: $id, to: $to, from: $from, sender: $sender, recipient: $recipient, subject: $subject, content: $content, isRead: $isRead, isReply: $isReply, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.isReply, isReply) || other.isReply == isReply) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, to, from, sender, recipient,
      subject, content, isRead, isReply, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      __$$MessageModelImplCopyWithImpl<_$MessageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageModelImplToJson(
      this,
    );
  }
}

abstract class _MessageModel extends MessageModel {
  const factory _MessageModel(
      {@HiveField(0) @JsonKey(name: "_id") required final String id,
      @HiveField(1) required final String to,
      @HiveField(2) required final String from,
      @HiveField(3) required final String sender,
      @HiveField(4) required final String recipient,
      @HiveField(5) required final String subject,
      @HiveField(6) required final String content,
      @HiveField(7) required final bool isRead,
      @HiveField(8) required final bool isReply,
      @HiveField(9) required final String createdAt,
      @HiveField(10) required final String updatedAt}) = _$MessageModelImpl;
  const _MessageModel._() : super._();

  factory _MessageModel.fromJson(Map<String, dynamic> json) =
      _$MessageModelImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "_id")
  String get id;
  @override
  @HiveField(1)
  String get to;
  @override
  @HiveField(2)
  String get from;
  @override
  @HiveField(3)
  String get sender;
  @override
  @HiveField(4)
  String get recipient;
  @override
  @HiveField(5)
  String get subject;
  @override
  @HiveField(6)
  String get content;
  @override
  @HiveField(7)
  bool get isRead;
  @override
  @HiveField(8)
  bool get isReply;
  @override
  @HiveField(9)
  String get createdAt;
  @override
  @HiveField(10)
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
