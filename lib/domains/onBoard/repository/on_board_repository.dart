import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/onBoard/entity/on_board_entity.dart';

abstract class OnBoardRepository {
  EitherFunc<OnBoardEntity> getOpenStatus();
}
