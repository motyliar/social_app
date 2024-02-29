import 'package:climbapp/core/datahelpers/params/repository_params.dart';

class LogOutParams extends RepositoryParams {
  const LogOutParams({required this.email, required super.url});
  final String email;

  @override
  Map<String, dynamic> requestMapBody() => {"userEmail": email};
}
