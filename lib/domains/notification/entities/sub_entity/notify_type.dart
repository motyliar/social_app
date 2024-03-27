import 'package:climbapp/core/constans/notify_type_con.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:flutter/widgets.dart';

abstract class NotifyType {
  const NotifyType({
    required String name,
    required bool kind,
    required String author,
  })  : _name = name,
        _kind = kind,
        _author = author;
  final String _name;
  final bool _kind;
  final String _author;

  String get getName => _name;
  String notifyText(BuildContext context);

  @override
  toString() => 'name: $_name author: $_author';
}

class NewRequests extends NotifyType {
  const NewRequests(
      {super.name = NotifyTypeCons.newReq,
      super.kind = true,
      required super.author});

  @override
  String notifyText(BuildContext context) {
    final l10n = context.l10n;
    if (_kind) {
      return l10n.newRequest + _author;
    } else {
      return _author + l10n.deleteRequest;
    }
  }
}

class RequestResolve extends NotifyType {
  const RequestResolve(
      {super.name = NotifyTypeCons.resolve,
      required super.kind,
      required super.author});

  @override
  String notifyText(BuildContext context) {
    final l10n = context.l10n;
    if (_kind) {
      return _author + l10n.requestAccept;
    } else {
      return _author + l10n.requestReject;
    }
  }
}

class NewMessage extends NotifyType {
  const NewMessage(
      {super.name = NotifyTypeCons.message,
      required super.kind,
      required super.author});

  @override
  String notifyText(BuildContext context) {
    final l10n = context.l10n;

    if (_kind) {
      return l10n.newMessage + _author;
    } else {
      return l10n.receivedMessage + _author;
    }
  }
}
