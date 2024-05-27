import 'package:flutter/material.dart';

class BottomSheetHeaderTitle extends StatelessWidget {
  final String titleText;
  final MainAxisAlignment mainAxisAlignment;
  final Color color;
  final double fontSize;
  const BottomSheetHeaderTitle({
    super.key,
    required this.titleText,
    required this.mainAxisAlignment,
    required this.color,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          titleText,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
