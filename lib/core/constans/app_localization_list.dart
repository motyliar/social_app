import 'package:climbapp/core/l10n/l10n.dart';
import 'package:flutter/material.dart';

abstract class AppLocalizationListHandler {
  List<String> listBuilder(BuildContext context) {
    return listBuilder_(context);
  }

  List<String> listBuilder_(BuildContext context);
  AppLocalizations _l10nBuilder(BuildContext context) {
    return context.l10n;
  }
}

class OnBoardLabelList extends AppLocalizationListHandler {
  @override
  List<String> listBuilder_(BuildContext context) {
    final l10n = _l10nBuilder(context);
    final listL10n = [
      l10n.labelFirst,
      l10n.labelSecond,
      l10n.labelThird,
    ];
    return listL10n;
  }
}

class OnBoardContentList extends AppLocalizationListHandler {
  @override
  List<String> listBuilder_(BuildContext context) {
    final l10n = _l10nBuilder(context);
    final listL10n = [
      l10n.contentFirst,
      l10n.contentSecond,
      l10n.contentThird,
    ];
    return listL10n;
  }
}
