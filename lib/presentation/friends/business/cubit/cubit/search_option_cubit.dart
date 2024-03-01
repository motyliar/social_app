import 'package:bloc/bloc.dart';

class SearchOptionCubit extends Cubit<bool> {
  SearchOptionCubit() : super(true);

  void changeSearchOption() => emit(!state);
}
