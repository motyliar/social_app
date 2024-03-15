import 'package:flutter/material.dart';

Future<DateTime> showDate(BuildContext context) async {
  var date = DateTime.now();
  await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2050))
      .then((value) => date = value ?? DateTime.now());
  return date;
}
