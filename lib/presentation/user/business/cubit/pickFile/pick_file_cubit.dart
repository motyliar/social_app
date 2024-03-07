import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pick_file_state.dart';

class PickFileCubit extends Cubit<PickFileState> {
  PickFileCubit() : super(const PickFileState());

  void setFileToSending(File file) => emit(PickFileState(imageFile: file));
}
