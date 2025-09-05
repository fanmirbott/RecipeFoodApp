import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/Appcolors.dart';

class NotifyWidget extends StatelessWidget {
  const NotifyWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.iconPrefix,
  });

  final String text;

  final Widget icon;
  final Widget? iconPrefix;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: 35.w,
          height: 35.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.redPinkMain,
          ),
          child: icon,
        ),
        SizedBox(
          width: 18.w,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
        Spacer(),
        ?iconPrefix,
      ],
    );
  }
}
