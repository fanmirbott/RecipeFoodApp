import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/Appcolors.dart';

class ReviewsButton extends StatelessWidget {
  const ReviewsButton({
    super.key, required this.backColor, required this.text, required this.textColor, required this.onPressed,
  });

  final Color backColor;
  final String text;
  final Color textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: 168.w,
        height: 29.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: backColor,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
