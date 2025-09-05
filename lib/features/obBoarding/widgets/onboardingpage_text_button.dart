import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';

class OnboardingpageTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const OnboardingpageTextButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: AppColors.pink,
        fixedSize: Size(207.w, 45.h),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.pinkSub,
        ),
      ),
    );
  }
}
