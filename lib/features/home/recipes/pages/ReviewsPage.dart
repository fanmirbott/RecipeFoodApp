import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipefoodapp/core/appDetails/bottom_nav_bar.dart';

import '../../../../core/utils/Appcolors.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Appcolors().backgroundBegie,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset("assets/Icons/back-arrow.svg"),
        ),
        centerTitle: true,
        title: Text(
          'Reviews',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Appcolors().redpinkmain,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 224.h,
            decoration: BoxDecoration(borderRadius: BorderRadiusGeometry.circular(20.r),
            color: Appcolors().redpinkmain),
            child: Row(
              children: [
                // Image.network()
              ],
            ),
          )
        ],
      ),
    );
  }
}
