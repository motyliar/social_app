import 'package:climbapp/core/datahelpers/params/repository_params.dart';

class RequestsParams extends RepositoryParams {
  const RequestsParams({required this.userList, required super.url});
  final List<String> userList;
  @override
  Map<String, dynamic> requestMapBody() => {"users": userList};
}
