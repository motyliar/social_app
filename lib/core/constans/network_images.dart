class NetworkURLStorage {
  List<String> get getImages => _prePageImages;

  static const String _welcomeFirstImage =
      "http://motyliar.webd.pro/social/welcome_01.jpg";
  static const String _welcomeSecondImage =
      "http://motyliar.webd.pro/social/welcome_02.jpg";
  static const String _welcomeThirdImage =
      "http://motyliar.webd.pro/social/welcome_03.jpg";
  final List<String> _prePageImages = [
    _welcomeFirstImage,
    _welcomeSecondImage,
    _welcomeThirdImage
  ];
}
