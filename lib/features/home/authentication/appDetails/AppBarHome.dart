import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/Appcolors.dart';
import 'categoryBottom.dart';

class AppBarHomePage extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHomePage({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 46.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Appcolors().backgroundBegie,
      title: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi! Dianne',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Appcolors().redpinkmain,
              ),
            ),
            Text(
              'What are you cooking today',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Appcolors().white,
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          constraints: BoxConstraints(minWidth: 35.w, minHeight: 35.h),
          style: IconButton.styleFrom(
            backgroundColor: Appcolors().pink,
            fixedSize: Size(30.w, 30.h),
          ),
          icon: SvgPicture.asset('assets/Icons/notification.svg'),
        ),
        IconButton(
          onPressed: () {},
          constraints: BoxConstraints(minWidth: 35.w, minHeight: 35.h),

          style: IconButton.styleFrom(
            backgroundColor: Appcolors().pink,
            fixedSize: Size(28.w, 28.h),
          ),
          icon: SvgPicture.asset('assets/Icons/search.svg'),
        ),
        SizedBox(width: 30.w),
      ],
      bottom: CategoryBottomBar(),
    );
  }
}
