import 'package:bloc/bloc.dart';

const String _englishLanguage = 'en';
const String _polishLanguage = 'pl';

class LocaleCubit extends Cubit<String> {
  LocaleCubit() : super(_englishLanguage);

  void changeLanguage() =>
      emit(state == _englishLanguage ? _polishLanguage : _englishLanguage);
  void englishLanguage() => emit('en');
}
