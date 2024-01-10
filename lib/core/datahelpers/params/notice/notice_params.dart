import 'package:climbapp/core/datahelpers/params/repository_params.dart';

class GetNoticeParams extends RepositoryParams {
  const GetNoticeParams({
    required super.url,
  });

  @override
  Map<String, dynamic> requestMapBody() => {};
}
