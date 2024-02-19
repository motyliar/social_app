import 'package:climbapp/core/l10n/l10n.dart';
import 'package:flutter/material.dart';

class FormValidation {
  final RegExp _emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp _userCorectRegExp = RegExp(r'^(?=.*[!@#$%^&*+=;:])');
  static void onFormValidate(
      {required GlobalKey<FormState> key, required VoidCallback action}) {
    if (key.currentState!.validate()) {
      action();
    }
  }

  String? userNameValidation(
      {required String value, required BuildContext context}) {
    if (_isEmpty(value: value)) {
      return AppLocalizations.of(context).valEmpty;
    }
    if (_haveWrongCharacters(value: value)) {
      return AppLocalizations.of(context).valWrongUserName;
    }
    return null;
  }

  String? emailValidation(
      {required String value, required BuildContext context}) {
    if (_isEmpty(value: value)) {
      return AppLocalizations.of(context).valEmpty;
    }
    if (!_isCorrectEmail(value: value)) {
      return AppLocalizations.of(context).valIncorrectEmail;
    }
    return null;
  }

  String? passwordValidation(
      {required String value,
      required BuildContext context,
      required String secondValue}) {
    if (_isEmpty(value: value)) {
      return AppLocalizations.of(context).valEmpty;
    }
    if (_thisSameValue(firstValue: value, secondValue: secondValue)) {
      return AppLocalizations.of(context).valEqualValues;
    }
    if (!_isEightDigit(value: value)) {
      return AppLocalizations.of(context).valTooShort;
    }
    if (!_isWeakPassword(value: value)) {
      return AppLocalizations.of(context).valWrongPassword;
    }
    return null;
  }

  String? forgotPasswordValidation(
      {required String value,
      required BuildContext context,
      required String secondValue}) {
    if (_thisSameValue(firstValue: value, secondValue: secondValue)) {
      return AppLocalizations.of(context).valEqualValues;
    }
    return null;
  }

  bool _thisSameValue({
    required String firstValue,
    required String secondValue,
  }) {
    return firstValue != secondValue;
  }

  bool _isWeakPassword({required String value}) {
    final RegExp regex =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*+=])');
    return regex.hasMatch(value);
  }

  bool _isEightDigit({required String value}) {
    return value.length > 7;
  }

  bool _isCorrectEmail({required String value}) {
    return _emailRegExp.hasMatch(value);
  }

  bool _isEmpty({required String value}) {
    return value.isEmpty;
  }

  bool _haveWrongCharacters({required String value}) {
    return _userCorectRegExp.hasMatch(value);
  }
}
