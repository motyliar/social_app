import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/notice/entities/notice_enums/exports.dart';

import 'package:flutter/material.dart';

List<DropdownMenuItem> generateMenu() {
  const categories = NoticeCategory.values;
  List<DropdownMenuItem> items = [];
  for (var category in categories) {
    items.add(DropdownMenuItem(
      value: category,
      child: Text(
        category.name.capitalize(),
        style: AppTextStyle.descriptionBig,
      ),
    ));
  }
  return items;
}
