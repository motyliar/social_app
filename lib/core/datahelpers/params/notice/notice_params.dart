import 'package:climbapp/core/datahelpers/params/repository_params.dart';

class GetNoticeParams extends RepositoryParams {
  const GetNoticeParams(
      {required super.url, required this.page, required this.pageSize});
  final int page;
  final int pageSize;

  @override
  Map<String, dynamic> requestMapBody() => {};

  @override
  toString() => 'page: $page pageSize: $pageSize';
}
