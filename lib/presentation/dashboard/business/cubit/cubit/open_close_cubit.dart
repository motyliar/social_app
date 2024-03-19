import 'package:bloc/bloc.dart';

class OpenCloseCubit extends Cubit<bool> {
  OpenCloseCubit() : super(true);

  void changeVisible({bool? change}) => emit(change ?? !state);
}
