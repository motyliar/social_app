import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/domains/notice/usecases/create_notice_comment_usecase.dart';
import 'package:equatable/equatable.dart';

part 'add_comment_state.dart';

class AddCommentCubit extends Cubit<AddCommentState> {
  final CreateNoticeCommentUseCase _comment;
  AddCommentCubit({required CreateNoticeCommentUseCase comment})
      : _comment = comment,
        super(AddCommentState());

  Future<void> addNewComment(CreateNoticeCommentsParams params) async {
    await _addNewComment(params);
  }

  Future<void> _addNewComment(CreateNoticeCommentsParams params) async {
    try {
      final response = await _getResponseFromDB(params);
      emit(AddCommentSuccess(status: response));
    } on ServerException catch (e) {
      emit(AddCommentFailed(message: e.message));
    }
  }

  Future<ResponseStatus> _getResponseFromDB(
      CreateNoticeCommentsParams params) async {
    final response = await _comment.execute(params).then((response) => response
        .fold((f) => throw ServerException(f.toString()), (data) => data));

    return response;
  }
}
