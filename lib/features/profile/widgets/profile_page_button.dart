import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/Appcolors.dart';

class ProfilePageButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const ProfilePageButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 175.w,
        height: 27.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(30.r),
          color: Appcolors().pink,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Appcolors().pinkSub,
          ),
        ),
      ),
    );
  }
}
