import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';

import '../../../core/routing/routes.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: IgnorePointer(
              child: Container(
                height: 126.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 34),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 280.94.w,
                height: 56.h,
                decoration: BoxDecoration(
                  color: AppColors.redPinkMain,
                  borderRadius: BorderRadiusGeometry.circular(33),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.go(Routes.homePage);
                      },
                      icon: SvgPicture.asset("assets/Icons/home.svg"),
                    ),
                    IconButton(
                      onPressed: () {
                        context.go(Routes.community);
                      },
                      icon: SvgPicture.asset("assets/Icons/community.svg"),
                    ),
                    IconButton(
                      onPressed: () {
                        context.push(Routes.categories);
                      },
                      icon: SvgPicture.asset("assets/Icons/categories.svg"),
                    ),
                    IconButton(
                      onPressed: () {
                        context.go(Routes.profilePage);
                      },
                      icon: SvgPicture.asset("assets/Icons/profile.svg"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
