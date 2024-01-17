import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'first_open_state.dart';

class FirstOpenCubit extends Cubit<FirstOpenState> {
  FirstOpenCubit() : super(FirstOpenInitial());
}
