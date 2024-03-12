import 'package:climbapp/domains/notice/entities/action/action_type.dart';

abstract class IAction {
  const IAction({required this.type});
  final ActionType type;
}

class Buy extends IAction {
  const Buy({super.type = ActionType.buy});
}

class Sell extends IAction {
  const Sell({super.type = ActionType.sell});
}

class Partner extends IAction {
  const Partner({super.type = ActionType.partner});
}
