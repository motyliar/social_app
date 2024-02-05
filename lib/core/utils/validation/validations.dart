import 'package:climbapp/core/l10n/l10n.dart';
import 'package:flutter/material.dart';

class FormValidation {
  static void onFormValidate(
      {required GlobalKey<FormState> key, required VoidCallback action}) {
    if (key.currentState!.validate()) {
      action();
    }
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
    return value.length <= 7;
  }

  String? passwordValidation(
      {required String value,
      required BuildContext context,
      required String secondValue}) {
    if (_thisSameValue(firstValue: value, secondValue: secondValue)) {
      return AppLocalizations.of(context).valEqualValues;
    }
    if (_isEightDigit(value: value)) {
      return AppLocalizations.of(context).valTooShort;
    }
    if (!_isWeakPassword(value: value)) {
      return AppLocalizations.of(context).valWrongPassword;
    }
    return null;
  }
}
