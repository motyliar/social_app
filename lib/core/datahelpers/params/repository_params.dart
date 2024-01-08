abstract class RepositoryParams {
  const RepositoryParams({this.url});
  final Uri? url;

  Map<String, dynamic> requestMapBody();
  Map<String, String> headers() => {'Content-Type': 'application/json'};
}
