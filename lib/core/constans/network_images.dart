class NetworkURLStorage {
  List<String> get getImages => _OnBoardImages;

  static const String _welcomeFirstImage =
      "http://motyliar.webd.pro/social/climbless.png";
  static const String _welcomeSecondImage =
      "http://motyliar.webd.pro/social/volleyless.png";
  static const String _welcomeThirdImage =
      "http://motyliar.webd.pro/social/runners.png";
  final List<String> _OnBoardImages = [
    _welcomeFirstImage,
    _welcomeSecondImage,
    _welcomeThirdImage
  ];
}
