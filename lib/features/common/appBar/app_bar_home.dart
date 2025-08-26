import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/Appcolors.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget{
  const AppBarHome({
    super.key, required this.title, required this.bottom,
  });

  final PreferredSizeWidget? bottom;
  final String title;

  @override
  Size get preferredSize => Size.fromHeight(
    kToolbarHeight + (bottom?.preferredSize.height ?? 0),
  );
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 72,
      leading: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset("assets/Icons/back-arrow.svg"),
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Appcolors().redpinkmain,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 6),
            width: 28.w,
            height: 28.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              color: Appcolors().pink,
            ),
            child: SvgPicture.asset("assets/Icons/notification.svg"),
          ),
        ),
        SizedBox(
          width: 6.w,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 4),
            width: 28.w,
            height: 28.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              color: Appcolors().pink,
            ),
            child: SvgPicture.asset(
              "assets/Icons/search.svg",
            ),
          ),
        ),
        SizedBox(
          width: 36.w,
        ),
      ],
      bottom: bottom,
    );
  }

}
