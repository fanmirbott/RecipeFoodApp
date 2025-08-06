import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipefoodapp/utils/Appcolors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 34),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 280.94.w,
          height: 56.h,
          decoration: BoxDecoration(
            color: Appcolors().redpinkmain,
            borderRadius: BorderRadiusGeometry.circular(33),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/Icons/home.svg"),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/Icons/community.svg"),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/Icons/categories.svg"),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/Icons/profile.svg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
