import 'package:bloc/bloc.dart';

class LikeIconCubit extends Cubit<bool> {
  LikeIconCubit() : super(true);

  void changeVisible() {
    emit(!state);
  }
}
