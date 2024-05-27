import 'package:flutter/material.dart';
import '../../constants.dart';

class AppGreet extends StatelessWidget {
  const AppGreet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ' تطبيق راحيل',
          textAlign: TextAlign.center,
          style: greetText,
        ),
      ],
    );
  }
}
