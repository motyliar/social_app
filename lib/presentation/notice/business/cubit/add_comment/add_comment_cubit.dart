import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_comment_state.dart';

class AddCommentCubit extends Cubit<AddCommentState> {
  AddCommentCubit() : super(AddCommentInitial());
}
