import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/icons/custom_icons.dart';
import 'package:flutter/material.dart';

class AppIcons {
  static const emailIcon = CustomIcon(
    Icons.mail,
  );
  static const passwordIcon = CustomIcon(
    Icons.password,
  );

  static const personIcon = CustomIcon(Icons.person);

  static const infoIcon = CustomIcon(
    Icons.help,
    size: 16,
    color: ColorPallete.pinkDecorationColor,
  );
  static const reply = CustomIcon(Icons.reply);
  static const friends = CustomIcon(Icons.people);
  static const messages = CustomIcon(Icons.message);
  static const profile = CustomIcon(Icons.person);
  static const logout = CustomIcon(
    Icons.logout,
    color: ColorPallete.pinkDecorationColor,
  );
  static const dashboardSearch = CustomIcon(
    Icons.manage_search,
    color: ColorPallete.pinkDecorationColor,
    size: 24,
  );
  static const searchPink = CustomIcon(
    Icons.search,
    color: ColorPallete.pinkDecorationColor,
    size: 24,
  );

  static const home = CustomIcon(Icons.home);
  static const delete = CustomIcon(
    Icons.delete,
    color: ColorPallete.pinkDecorationColor,
    size: 16,
  );
  static const deleteBig = CustomIcon(
    Icons.delete,
    color: Colors.black,
    size: 35,
  );
  static const forward = CustomIcon(
    Icons.forward,
    size: 16,
  );
  static const edit = CustomIcon(
    Icons.edit,
    size: 16,
  );
  static const editBig = CustomIcon(
    Icons.edit,
    color: Colors.black,
    size: 35,
  );
  static const gallery = CustomIcon(Icons.collections_bookmark, size: 50);
  static const camera = CustomIcon(Icons.photo_camera, size: 50);
  static const star = CustomIcon(
    Icons.star,
    color: ColorPallete.rateStarYellow,
  );
  static const notifications = CustomIcon(Icons.notifications);

  static const smile = CustomIcon(
    Icons.mood,
    size: 40,
    color: ColorPallete.pinkDecorationColor,
  );

  static const thumbDown = CustomIcon(
    Icons.thumb_down,
    size: 35,
    color: ColorPallete.pinkDecorationColor,
  );
  static const thumbUp = CustomIcon(
    Icons.thumb_up,
    size: 35,
  );
}
