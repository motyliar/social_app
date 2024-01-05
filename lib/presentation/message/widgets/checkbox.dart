import 'package:flutter/material.dart';

class CheckBoxWidgets extends StatelessWidget {
  const CheckBoxWidgets(
      {required this.isCheck,
      this.onTap,
      this.size = 18,
      this.color = Colors.red,
      super.key});

  final double size;
  final Color color;
  final bool isCheck;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
          width: 1.5,
          color: Colors.black,
        )),
        child: Container(
          color: isCheck ? color.withOpacity(0.3) : Colors.white,
          width: size,
          height: size,
          child: isCheck
              ? Icon(
                  Icons.done,
                  size: size,
                  color: Colors.black,
                  weight: 700,
                  grade: 200,
                )
              : null,
        ),
      ),
    );
  }
}
