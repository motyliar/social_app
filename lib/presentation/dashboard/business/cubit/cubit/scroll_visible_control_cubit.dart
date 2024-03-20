import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ScrollVisibleControlCubit extends Cubit<bool> {
  final ScrollController controller;
  ScrollVisibleControlCubit(this.controller) : super(false) {
    controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      emit(true);
    } else {
      emit(false);
    }
  }

  @override
  Future<void> close() {
    controller.removeListener(_scrollListener);
    return super.close();
  }
}
