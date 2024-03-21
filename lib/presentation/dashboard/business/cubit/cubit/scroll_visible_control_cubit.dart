import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/widgets.dart';

class ScrollVisibleControlCubit extends Cubit<ScrollVisibleControlState> {
  final ScrollController controller;
  ScrollVisibleControlCubit(this.controller)
      : super(const ScrollVisibleControlState(visible: false)) {
    controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      emit(state.copyWith(visible: true, value: state.value + 2));
    } else {
      emit(state.copyWith(visible: false));
    }
  }

  @override
  Future<void> close() {
    controller.removeListener(_scrollListener);
    return super.close();
  }
}

class ScrollVisibleControlState extends Equatable {
  const ScrollVisibleControlState({required this.visible, this.value = 2});
  final bool visible;
  final int value;

  ScrollVisibleControlState copyWith({bool? visible, int? value}) =>
      ScrollVisibleControlState(
          visible: visible ?? this.visible, value: value ?? this.value);
  @override
  List<Object> get props => [visible, value];
}
