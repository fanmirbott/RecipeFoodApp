import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/features/common/bottomNavigationBar/bottom_nav_bar.dart';
import 'package:recipefoodapp/core/network/cleint.dart';
import 'package:recipefoodapp/core/router/routerName.dart';
import 'package:recipefoodapp/data/repositories/yourRecipeRepostory.dart';
import 'package:recipefoodapp/features/yourRecipe/managers/YourRecipeViewModel.dart';
import '../../../../../../../core/utils/Appcolors.dart';

class YourRecipePage extends StatelessWidget {
  const YourRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          YourRecipeViewModel(YourRecipeRepository(ApiClient())),
      builder: (context, child) => Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Appcolors().backgroundBegie,
          leading: IconButton(
            onPressed: () => context.go(Routers.homePage),
            icon: SvgPicture.asset("assets/Icons/back-arrow.svg"),
          ),
          centerTitle: true,
          title: Text(
            "Your Recipes",
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
        body: Consumer<YourRecipeViewModel>(
          builder: (context, vm, child) {
            if (vm.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (vm.recipes.isEmpty) {
              return const Center(child: Text("Ma'lumot topilmadi"));
            }
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 14),
                  width: 430.w,
                  height: 255.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Appcolors().redpinkmain,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Most Viewed Today',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Appcolors().white,
                        ),
                      ),
                      SizedBox(height: 9.h),
                      Row(
                        spacing: 16.w,
                        children: List.generate(2, (index) {
                          return SizedBox(
                            width: 168.52.w,
                            height: 195.h,
                            child: GestureDetector(
                              onTap: () {
                                context.push(Routers.recipe, extra: vm.recipes[index].id);
                              },
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Stack(
                                      children: [
                                        Image.network(
                                          vm.recipes[index].photo,
                                          width: 168.52.w,
                                          height: 162.h,
                                          fit: BoxFit.cover,
                                        ),
                                        Positioned(
                                          top: 7.h,
                                          left: 132.w,
                                          child: GestureDetector(
                                            onTap: () => vm.toggleLike(index),
                                            child: Container(
                                              width: 28.w,
                                              height: 28.h,
                                              decoration: BoxDecoration(
                                                color: vm.likedStates[index]
                                                    ? Appcolors().redpinkmain
                                                    : Appcolors().pink,
                                                shape: BoxShape.circle,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/Icons/like.svg',
                                                width: 15.w,
                                                height: 15.h,
                                                fit: BoxFit.none,
                                                color: vm.likedStates[index]
                                                    ? Appcolors().white
                                                    : Appcolors().pinkSub,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
                                      width: 168.52.w,
                                      height: 48.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          13.r,
                                        ),
                                        color: Appcolors().white,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(vm.recipes[index].title),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    vm.recipes[index].rating
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Appcolors().pinkSub,
                                                    ),
                                                  ),
                                                  SvgPicture.asset(
                                                    'assets/Icons/star.svg',
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/Icons/clock.svg',
                                                  ),
                                                  SizedBox(width: 4),
                                                  Text(
                                                    vm
                                                        .recipes[index]
                                                        .timeRequired
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Appcolors().pinkSub,
                                                    ),
                                                  ),
                                                  Text(
                                                    'min',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Appcolors().pinkSub,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsetsGeometry.only(
                      right: 36,
                      left: 36,
                      bottom: 100,
                      top: 31,
                    ),
                    itemCount: vm.recipes.length - 2,
                    itemBuilder: (context, index) {
                      final recipe = vm.recipes[index + 2];
                      return SizedBox(
                        width: 170.w,
                        height: 226.h,
                        child: GestureDetector(
                          onTap: () {
                            context.push(Routers.recipe, extra: recipe.id);
                          },
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: EdgeInsets.only(right: 15, left: 15, top: 15),
                                  width: 160.w,
                                  height: 80.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13.r),
                                    color: Appcolors().white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        vm.recipes[index].title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 13,
                                          color: Appcolors().backgroundBegie,
                                        ),
                                      ),
                                      Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        vm.recipes[index+2].description,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Appcolors().backgroundBegie,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                recipe.rating.toString(),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Appcolors().pinkSub,
                                                ),
                                              ),
                                              SvgPicture.asset(
                                                'assets/Icons/star.svg',
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/Icons/clock.svg',
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                recipe.timeRequired.toString(),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Appcolors().pinkSub,
                                                ),
                                              ),
                                              Text(
                                                'min',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Appcolors().pinkSub,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Stack(
                                  children: [
                                    Image.network(
                                      recipe.photo,
                                      width: 170.w,
                                      height: 153.h,
                                      fit: BoxFit.cover,
                                    ),
                                    Positioned(
                                      top: 7.h,
                                      left: 132.w,
                                      child: GestureDetector(
                                        onTap: () => vm.toggleLike(index + 2),
                                        child: Container(
                                          width: 28.w,
                                          height: 28.h,
                                          decoration: BoxDecoration(
                                            color: vm.likedStates[index + 2]
                                                ? Appcolors().redpinkmain
                                                : Appcolors().pink,
                                            shape: BoxShape.circle,
                                          ),
                                          child: SvgPicture.asset(
                                            'assets/Icons/like.svg',
                                            width: 15.w,
                                            height: 15.h,
                                            fit: BoxFit.none,
                                            color: vm.likedStates[index + 2]
                                                ? Appcolors().white
                                                : Appcolors().pinkSub,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 15,
                      mainAxisExtent: 226,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
