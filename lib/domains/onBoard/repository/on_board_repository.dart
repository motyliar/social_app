import 'package:climbapp/core/datahelpers/params/onboard/on_board_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/onBoard/entity/on_board_entity.dart';

abstract class OnBoardRepository {
  EitherFunc<OnBoardEntity> getOpenStatus();
  EitherFunc<ResponseStatus> changeOpenStatus(OnBoardParam param);
}
