import 'package:bloc/bloc.dart';

class TapDownCubit extends Cubit<bool> {
  TapDownCubit() : super(false);
  void onTapDown() => emit(!state);
}
