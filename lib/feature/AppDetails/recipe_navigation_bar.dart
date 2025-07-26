import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeNavigationBar extends StatelessWidget {
  const RecipeNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 126.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 74, right: 74),
          child: Container(
            height: 56.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusGeometry.circular(33),
              color: Color(0xFFFD5D69),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(),
                  child: SvgPicture.asset("assets/Icons/home.svg", width: 26.w),
                ),
                TextButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    "assets/Icons/community.svg",
                    width: 26.w,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    "assets/Icons/categories.svg",
                    width: 26.w,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    "assets/Icons/profile.svg",
                    width: 21.w,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
