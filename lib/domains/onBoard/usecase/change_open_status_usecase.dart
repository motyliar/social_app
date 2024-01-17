import 'package:climbapp/core/datahelpers/params/onboard/on_board_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/onBoard/repository/on_board_repository.dart';

class ChangeOpenStatusUseCase {
  const ChangeOpenStatusUseCase({required OnBoardRepository onBoard})
      : _onBoard = onBoard;
  final OnBoardRepository _onBoard;

  EitherFunc<ResponseStatus> execute(OnBoardParam param) {
    return _onBoard.changeOpenStatus(param);
  }
}
