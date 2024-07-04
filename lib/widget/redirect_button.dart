import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/constant.dart';


class RedirectButton extends StatelessWidget {
  const RedirectButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.label,
  });

  final String text;
  final void Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
            onTap: onTap,
            child: Text(
              label,
              style: const TextStyle(color: themeColor1,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),
            )),
      ],
    );
  }
}
