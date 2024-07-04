
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.onTap,
    required this.buttonColor,
    required this.image,
    required this.title,
    required this.width,
    required this.textColor,
  });

  final Function()? onTap;
  final Color buttonColor;
  final String image;
  final String title;
  final double width;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(50)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Image.asset(
                  image,
                  scale: 25,
                ),
              ),
            ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.05,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
