import 'package:bloc/bloc.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/datahelpers/status_service/response_status.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/domains/notice/usecases/update_comment_usecase.dart';
import 'package:equatable/equatable.dart';

part 'update_comment_state.dart';

class UpdateCommentCubit extends Cubit<UpdateCommentState> {
  final UpdateCommentUseCase _updateComment;
  UpdateCommentCubit({required UpdateCommentUseCase updateComment})
      : _updateComment = updateComment,
        super(UpdateCommentState());
  Future<void> updateSingleComment(UpdateCommentParams params) async {
    await _updateSingleComment(params);
  }

  Future<void> _updateSingleComment(UpdateCommentParams params) async {
    try {
      await _getResponseFromDB(params)
          .then((value) => emit(UpdateCommentSuccess(status: value)));
    } on ServerException catch (e) {
      emit(UpdateCommentFailed(message: e.message));
    }
  }

  Future<ResponseStatus> _getResponseFromDB(UpdateCommentParams params) async {
    final response = _updateComment
        .execute(params)
        .then((response) => response.fold((l) => throw l, (r) => r));

    return response;
  }
}
