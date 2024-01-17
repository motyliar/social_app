import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/onBoard/entity/on_board_entity.dart';
import 'package:climbapp/domains/onBoard/repository/on_board_repository.dart';

class GetOpenStatusUseCase {
  const GetOpenStatusUseCase({required OnBoardRepository onBoardRepository})
      : _onBoardRepository = onBoardRepository;
  final OnBoardRepository _onBoardRepository;

  EitherFunc<OnBoardEntity> execute() {
    return _onBoardRepository.getOpenStatus();
  }
}
