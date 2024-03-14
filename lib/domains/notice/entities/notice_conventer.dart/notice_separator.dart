import 'package:climbapp/domains/notice/entities/notice_enums/sports_category.dart';
import 'package:climbapp/domains/notice/entities/notice_enums/type_action.dart';

class NoticeSeparator {
  static NoticeCategory convertToCategory(String category) {
    return _convertToCategory(category);
  }

  static ActionType convertToType(String type) {
    return _convertToType(type);
  }

  static NoticeCategory _convertToCategory(String category) {
    switch (category) {
      case _football:
        return NoticeCategory.football;
      case _padel:
        return NoticeCategory.padel;
      case _volleyball:
        return NoticeCategory.volleyball;
      case _squash:
        return NoticeCategory.squash;
      case _climbing:
        return NoticeCategory.climbing;
      case _running:
        return NoticeCategory.running;
      case _tennis:
        return NoticeCategory.tennis;
      case _hiking:
        return NoticeCategory.hiking;
      case _gym:
        return NoticeCategory.gym;
      case _biking:
        return NoticeCategory.biking;
      case _general:
        return NoticeCategory.general;
      default:
        return NoticeCategory.general;
    }
  }

  static ActionType _convertToType(String type) {
    switch (type) {
      case _buy:
        return ActionType.buy;
      case _sell:
        return ActionType.sell;
      case _partner:
        return ActionType.partner;
      default:
        return ActionType.partner;
    }
  }
}

const String _football = 'football';
const String _padel = 'padel';
const String _volleyball = 'volleyball';
const String _squash = 'squash';
const String _climbing = 'climbing';
const String _running = 'running';
const String _tennis = 'tennis';
const String _hiking = 'hiking';
const String _gym = 'gym';
const String _biking = 'biking';
const String _general = 'general';

const String _buy = 'buy';
const String _sell = 'sell';
const String _partner = 'partner';
