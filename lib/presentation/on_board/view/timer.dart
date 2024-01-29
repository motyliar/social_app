import 'dart:async';

import 'package:climbapp/presentation/on_board/business/cubit/image_changer_cubit.dart';

Timer onTimer() {
  return Timer.periodic(Duration(seconds: 4), (timer) {
    ImageChangerCubit.instance().changeImage(1);
  });
}
