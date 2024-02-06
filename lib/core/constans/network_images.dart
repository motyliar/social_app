class ImagesURL {
  static const signInTopBackground =
      'http://motyliar.webd.pro/social/login_background.jpg';

  static const signInBottomBackground =
      'http://motyliar.webd.pro/social/bottom_background.jpg';

  static const warningSnackBarBackground =
      'http://motyliar.webd.pro/social/annoucment.png';

  static const successSnackBarBackground =
      'http://motyliar.webd.pro/social/approve.png';
}

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
