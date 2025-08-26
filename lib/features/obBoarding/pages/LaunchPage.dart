import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipefoodapp/core/router/routerName.dart';
import '../../../../../core/utils/Appcolors.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key});

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      context.go(Routers.homePage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors().redpinkmain,
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 307.w,
          height: 252.02.h,
          child: Column(
            children: [
              Container(
                width: 152.67.w,
                height: 152.67.h,
                decoration: BoxDecoration(
                  color: Appcolors().white,
                  shape: BoxShape.circle,
                ),
                child: Row(
                  spacing: 12.78,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/IconsApp/knife.png',
                      width: 13.94.w,
                      height: 91.92.h,
                    ),
                    Image.asset(
                      'assets/IconsApp/fork.png',
                      width: 15.94.w,
                      height: 91.92.h,
                    ),
                  ],
                ),
              ),
              Text(
                'DishDash',
                style: TextStyle(
                  fontSize: 63.84,
                  fontWeight: FontWeight.w600,
                  color: Appcolors().white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
