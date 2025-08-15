import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';

class LoginPageTextButton extends StatelessWidget {
  const LoginPageTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
  });

  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        fixedSize: Size(207.w, 45.h),
        backgroundColor: backgroundColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Appcolors().pinkSub,
        ),
      ),
    );
  }
}
