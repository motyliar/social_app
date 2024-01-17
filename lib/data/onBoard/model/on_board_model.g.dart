// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'on_board_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OnBoardModelAdapter extends TypeAdapter<OnBoardModel> {
  @override
  final int typeId = 10;

  @override
  OnBoardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OnBoardModel(
      wasOpened: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, OnBoardModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.wasOpened);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OnBoardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
