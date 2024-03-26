import 'package:climbapp/core/datahelpers/params/repository_params.dart';

class NotificationParams extends RepositoryParams {
  const NotificationParams({required super.url, required this.newNotify});
  final Map<String, dynamic> newNotify;
  @override
  Map<String, dynamic> requestMapBody() => newNotify;
}
