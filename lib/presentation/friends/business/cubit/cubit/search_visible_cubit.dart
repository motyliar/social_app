import 'package:bloc/bloc.dart';

class SearchVisibleCubit extends Cubit<bool> {
  SearchVisibleCubit() : super(false);

  void changeVisible() => emit(!state);
}
