import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class DotStateCubit extends Cubit<int> {
  DotStateCubit._() : super(0);

  static final DotStateCubit _instance = DotStateCubit._();
  factory DotStateCubit.instance() => _instance;

  void changeDotValue(int currentIndex) {
    emit(currentIndex);
  }
}
