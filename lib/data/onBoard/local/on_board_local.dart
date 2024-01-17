import 'package:climbapp/core/datahelpers/params/onboard/on_board_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/data/onBoard/model/on_board_model.dart';
import 'package:hive/hive.dart';

abstract class OnBoardLocalSources {
  Future<OnBoardModel> getOpenStatus();
  Future<ResponseStatus> changeOpenStatus(OnBoardParam param);
}

class OnBoardLocalImpl extends OnBoardLocalSources {
  final Box<OnBoardModel> box = Hive.box<OnBoardModel>('on-board');
  @override
  Future<OnBoardModel> getOpenStatus() async {
    if (box.isEmpty) {
      await _putNewDataToEmptyBox();
      return OnBoardModel(wasOpened: false);
    }
    return box.get(0)!;
  }

  @override
  Future<ResponseStatus> changeOpenStatus(OnBoardParam param) async {
    if (box.isEmpty) {
      throw HiveExceptions.emptyData();
    } else {
      await box.put(0, OnBoardModel(wasOpened: param.wasOpened));
      return ResponseStatus.success;
    }
  }

  Future<void> _putNewDataToEmptyBox() async {
    await box.put(0, OnBoardModel(wasOpened: false));
  }
}
