import 'package:climbapp/core/datahelpers/params/repository_params.dart';

class GetNoticeParams extends RepositoryParams {
  const GetNoticeParams({
    this.noticeId,
    required super.url,
  });
  final String? noticeId;

  @override
  Map<String, dynamic> requestMapBody() => {};
}
