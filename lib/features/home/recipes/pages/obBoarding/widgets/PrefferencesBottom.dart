import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreferencesBottom extends StatelessWidget {
  const PreferencesBottom({
    super.key,
    required this.iconButtonText,
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
  });

  final String iconButtonText;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        fixedSize: Size(162.w, 45.h),
        backgroundColor: buttonColor,
      ),
      icon: Text(
        iconButtonText,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: textColor,
        ),
      ),
    );
  }
}
