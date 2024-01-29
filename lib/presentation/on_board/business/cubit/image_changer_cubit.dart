import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:climbapp/core/constans/network_images.dart';
import 'package:equatable/equatable.dart';

part 'image_changer_state.dart';

class ImageChangerCubit extends Cubit<int> {
  ImageChangerCubit._() : super(0);

  static final ImageChangerCubit _instance = ImageChangerCubit._();
  factory ImageChangerCubit.instance() => _instance;
  ImageChangerCubit get instance => _instance;

  void changeImage(int value) {
    emit(value);
  }

  int valueChanger() {
    if (state == 0) {
      return 1;
    } else if (state == 1) {
      return 2;
    } else if (state == 2) {
      return 0;
    } else
      return 0;
  }

  Timer? timer;
  void timerImager(bool isOpen) {
    if (isOpen) {
      timer = Timer.periodic(Duration(seconds: 3), (timer) {
        changeImage(valueChanger());
      });
    } else {
      timer?.cancel();
    }
  }

  void stopTimer() {}
}
