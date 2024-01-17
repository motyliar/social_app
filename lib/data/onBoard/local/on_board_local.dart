import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/data/onBoard/model/on_board_model.dart';
import 'package:hive/hive.dart';

abstract class OnBoardLocalSources {
  Future<OnBoardModel> getOpenStatus();
  Future<ResponseStatus> changeOpenStatus();
}

class OnBoardLocalImpl extends OnBoardLocalSources {
  final Box<OnBoardModel> box = Hive.box<OnBoardModel>('on-board');
  @override
  Future<OnBoardModel> getOpenStatus() async {
    return box.get(0) ?? OnBoardModel(wasOpened: true);
  }

  @override
  Future<ResponseStatus> changeOpenStatus() async {
    if (box.isEmpty) {
      throw HiveExceptions.emptyData();
    } else {
      await box.put(0, OnBoardModel(wasOpened: false));
      return ResponseStatus.success;
    }
  }
}
