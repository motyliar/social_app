import 'package:climbapp/domains/onBoard/entity/on_board_entity.dart';
import 'package:hive/hive.dart';

part 'on_board_model.g.dart';

@HiveType(typeId: 10)
class OnBoardModel extends HiveObject {
  OnBoardModel({required this.wasOpened});
  @HiveField(0)
  bool wasOpened;

  @override
  toString() => wasOpened.toString();

  OnBoardEntity toEntity() => OnBoardEntity(wasOpened: wasOpened);
}
