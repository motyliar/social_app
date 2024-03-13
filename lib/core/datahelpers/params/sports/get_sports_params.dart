import 'package:climbapp/core/datahelpers/params/repository_params.dart';

class GetSportParams extends RepositoryParams {
  const GetSportParams({super.url});

  @override
  Map<String, dynamic> requestMapBody() => {};
}

class UpdateSportParams extends RepositoryParams {
  const UpdateSportParams({required this.body, super.url});

  final Map<String, dynamic> body;

  @override
  Map<String, dynamic> requestMapBody() => body;
}
