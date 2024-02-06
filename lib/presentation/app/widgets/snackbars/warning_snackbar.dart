import 'package:flutter/material.dart';

class WarningSnackBarWidgets extends StatelessWidget {
  const WarningSnackBarWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Image.network(
            'http://motyliar.webd.pro/social/annoucment.png',
            width: 250,
            height: 250,
          ),
        ),
        const Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(right: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('oOPS?!'),
                Text(
                  'Something Wrong',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
