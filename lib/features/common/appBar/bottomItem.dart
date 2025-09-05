import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';


class BottomItem extends StatelessWidget {
  const BottomItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.id,
  });

  final int id;
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Center(
        child: Container(
          height: 25.h,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 9.w),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.redPinkMain : Colors.transparent,
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.redPinkMain,
            ),
          ),
        ),
      ),
    );
  }
}