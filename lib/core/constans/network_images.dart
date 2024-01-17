class NetworkURLStorage {
  List<String> get getImages => _OnBoardImages;

  static const String _welcomeFirstImage =
      "http://motyliar.webd.pro/social/welcome_01.jpg";
  static const String _welcomeSecondImage =
      "http://motyliar.webd.pro/social/welcome_02.jpg";
  static const String _welcomeThirdImage =
      "http://motyliar.webd.pro/social/welcome_03.jpg";
  final List<String> _OnBoardImages = [
    _welcomeFirstImage,
    _welcomeSecondImage,
    _welcomeThirdImage
  ];
}
