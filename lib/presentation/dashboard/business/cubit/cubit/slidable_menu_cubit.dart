import 'package:bloc/bloc.dart';

Map<String, bool> _states = {
  'first': true,
  'second': true,
  'third': true,
};

class SlidableMenuCubit extends Cubit<Map<String, bool>> {
  SlidableMenuCubit() : super(_states);

  void changeVisible(String windowName) {
    Map<String, bool> mapa = state;
    if (mapa.containsKey(windowName)) {
      mapa[windowName] = !(mapa[windowName] ?? false);
    }
    emit(Map.from(mapa));
  }
}
