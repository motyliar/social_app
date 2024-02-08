import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ScrollVisibleControlCubit extends Cubit<bool> {
  final ScrollController controller;
  ScrollVisibleControlCubit(this.controller) : super(true) {
    controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (controller.position.userScrollDirection == ScrollDirection.reverse) {
      emit(false);
    } else {
      emit(true);
    }
  }

  @override
  Future<void> close() {
    controller.removeListener(_scrollListener);
    return super.close();
  }
}
