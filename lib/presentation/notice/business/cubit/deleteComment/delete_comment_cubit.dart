import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/domains/notice/usecases/delete_single_comment_usecase.dart';
import 'package:equatable/equatable.dart';

part 'delete_comment_state.dart';

class DeleteCommentCubit extends Cubit<DeleteCommentState> {
  final DeleteSingleCommentUseCase _deleteComment;
  DeleteCommentCubit({required DeleteSingleCommentUseCase deleteComment})
      : _deleteComment = deleteComment,
        super(DeleteCommentState());
  Future<void> deleteComment(GetNoticeParams params) async {
    try {
      final response = await _getResponseFromDB(params);
      emit(DeleteCommentSuccess(status: response));
    } on ServerException catch (e) {
      emit(DeleteCommentFailed(message: e.message));
    }
  }

  Future<ResponseStatus> _getResponseFromDB(GetNoticeParams params) async {
    final response = await _deleteComment.execute(params).then(
        (r) => r.fold((l) => throw ServerException(l.toString()), (r) => r));
    return response;
  }
}
