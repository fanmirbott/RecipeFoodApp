import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/appDetails/bottom_nav_bar.dart';
import 'package:recipefoodapp/utils/Appcolors.dart';

import '../../../managers/RecipeDetailProvider.dart';

class RecipeDetail extends StatelessWidget {
  RecipeDetail({super.key, required this.id});

  final int id;

  String gmail = '@';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeDetailProvider(id: id),
      builder: (context, child) => Consumer<RecipeDetailProvider>(
        builder: (context, vm, child) => Scaffold(
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
              vm.recipeData['title'],
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Appcolors().redpinkmain,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(backgroundColor: Appcolors().pink),
                icon: SvgPicture.asset("assets/Icons/notification.svg"),
              ),
              IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(backgroundColor: Appcolors().pink),
                icon: SvgPicture.asset("assets/Icons/search.svg"),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavBar(),
          body: vm.isLoading
              ?  Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 36),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        SizedBox(
                          width: 357.w,
                          height: 337.h,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: EdgeInsetsGeometry.symmetric(
                                    horizontal: 10,
                                  ),
                                  width: 357.w,
                                  height: 70.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      10,
                                    ),
                                    color: Appcolors().redpinkmain,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        vm.recipeData['title'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: Appcolors().white,
                                        ),
                                      ),
                                      Spacer(),
                                      Row(
                                        spacing: 4,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/Icons/star.svg",
                                            width: 10.w,
                                            height: 10.h,
                                            color: Appcolors().white,
                                          ),
                                          Text(
                                            vm.recipeData['rating'].toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Appcolors().white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 10.w),
                                      Row(
                                        spacing: 4,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/Icons/reviews.svg",
                                            width: 10.w,
                                            height: 10.h,
                                            color: Appcolors().white,
                                          ),
                                          Text(
                                            vm.recipeData['reviewsCount']
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Appcolors().white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(10),
                                child: Stack(
                                  children: [
                                    Image.network(
                                      vm.recipeData['photo'],
                                      width: 357.w,
                                      height: 281.h,
                                      fit: BoxFit.cover,
                                    ),
                                    Positioned(
                                      top: 105,
                                      right: 142,
                                      child: IconButton(
                                        onPressed: () {},
                                        style: IconButton.styleFrom(
                                          shape: CircleBorder(),
                                          fixedSize: Size(71, 75),
                                          backgroundColor:
                                              Appcolors().redpinkmain,
                                        ),
                                        icon: SvgPicture.asset(
                                          'assets/Icons/play.svg',
                                          width: 29,
                                          height: 40,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 26.h),
                        SizedBox(
                          height: 63.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(
                                  100.r,
                                ),
                                child: Image.network(
                                  vm.recipeData['user']['profilePhoto'],
                                  width: 61.w,
                                  height: 63.h,
                                ),
                              ),
                              SizedBox(width: 15.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        gmail,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Appcolors().redpinkmain,
                                        ),
                                      ),
                                      Text(
                                        vm.recipeData['user']['username'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Appcolors().redpinkmain,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        vm.recipeData['user']['firstName'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 11,
                                          color: Appcolors().white,
                                        ),
                                      ),
                                      SizedBox(width: 2.w),
                                      Text(
                                        vm.recipeData['user']['lastName'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 11,
                                          color: Appcolors().white,
                                        ),
                                      ),
                                      Text(
                                        '-chef',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 11,
                                          color: Appcolors().white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  fixedSize: Size(109.09.w, 21.h),
                                  minimumSize: Size(109.09.w, 21.h),
                                  backgroundColor: Appcolors().pink,
                                ),
                                child: Text(
                                  'Following',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Appcolors().pinkSub,
                                  ),
                                ),
                              ),
                              SizedBox(width: 9.w),
                              GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/Icons/three_dots.svg',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Divider(color: Appcolors().pinkSub),
                        SizedBox(height: 31.h),
                        Row(
                          spacing: 4,
                          children: [
                            Text(
                              'Details',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Appcolors().redpinkmain,
                              ),
                            ),
                            SizedBox(width: 11.h),
                            SvgPicture.asset('assets/Icons/clock.svg'),
                            Text(
                              vm.recipeData['timeRequired'].toString(),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Appcolors().white,
                              ),
                            ),
                            Text(
                              'min',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Appcolors().white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 36,
                          child: Text(
                            vm.recipeData['instructions'][0]['text'],
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Appcolors().white,
                            ),
                          ),
                        ),
                        SizedBox(height: 31),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Ingredients',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Appcolors().redpinkmain,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: vm.recipeData['ingredients'].length,
                              itemBuilder: (context, index) {
                                final ingredient =
                                    vm.recipeData['ingredients'][index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2.0,
                                  ),
                                  child: Text(
                                    '${ingredient['amount']} ${ingredient['name']}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
