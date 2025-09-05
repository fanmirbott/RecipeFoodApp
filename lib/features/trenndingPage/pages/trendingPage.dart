import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/features/common/bottomNavigationBar/bottom_nav_bar.dart';
import 'package:recipefoodapp/core/cleint.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';
import 'package:recipefoodapp/data/repositories/recipe/trendingRecipeRepostory.dart';
import 'package:recipefoodapp/features/trenndingPage/managers/TrendingRecipeViewModel.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({super.key});

  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  bool like = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          TrendingViewModel(TrendingRepository(client: ApiClient())),
      child: Consumer<TrendingViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.trendingRecipe == null) {
            return const Center(child: Text("Ma'lumot topilmadi"));
          }
          final recipe = vm.trendingRecipe!;
          return Scaffold(
            extendBody: true,
            appBar: AppBar(
              backgroundColor: AppColors.backgroundBeige,
              leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: SvgPicture.asset("assets/Icons/back-arrow.svg"),
              ),
              centerTitle: true,
              title: Text(
                "Trending Recipes",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: AppColors.redPinkMain,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.pink,
                  ),
                  icon: SvgPicture.asset("assets/Icons/notification.svg"),
                ),
                IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.pink,
                  ),
                  icon: SvgPicture.asset("assets/Icons/search.svg"),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 430.w,
                    height: 241.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColors.redPinkMain,
                    ),
                    child: Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 36),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 9.h,
                          ),
                          Text(
                            'most viewed today',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          SizedBox(
                            width: 358.w,
                            height: 182.h,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      left: 12.w,
                                      right: 10.w,
                                      top: 20.h,
                                    ),
                                    width: 348.w,
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14.r),
                                      color: AppColors.white,
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 265.31.w,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                recipe.title,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13,
                                                  color: AppColors
                                                      .backgroundBeige,
                                                ),
                                              ),
                                              Text(
                                                recipe.description,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 13,
                                                  color: AppColors
                                                      .backgroundBeige,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/Icons/clock.svg',
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  recipe.timeRequired
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.pinkSub,
                                                  ),
                                                ),
                                                Text(
                                                  'min',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.pinkSub,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  recipe.rating.toString(),
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.pinkSub,
                                                  ),
                                                ),
                                                SvgPicture.asset(
                                                  'assets/Icons/star.svg',
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
                                  borderRadius: BorderRadius.circular(14.r),
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        recipe.photo,
                                        width: 358.w,
                                        height: 143.h,
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                        top: 7,
                                        left: 322,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              like = !like;
                                            });
                                          },
                                          child: Container(
                                            width: 28.w,
                                            height: 28.h,
                                            decoration: BoxDecoration(
                                              color: like
                                                  ? AppColors.redPinkMain
                                                  : AppColors.pink,
                                              shape: BoxShape.circle,
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/Icons/like.svg',
                                              width: 15.w,
                                              height: 15.h,
                                              fit: BoxFit.none,
                                              color: like
                                                  ? AppColors.white
                                                  : AppColors.pinkSub,
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
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 36),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'see all',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.redPinkMain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.only(
                      right: 36,
                      left: 36,
                      bottom: 100,
                    ),
                    child: Column(
                      spacing: 15,
                      children: [
                        ...List.generate(vm.categories.length, (index) {
                          return SizedBox(
                            width: 358.w,
                            height: 150.h,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                  width: 209.w,
                                  height: 122.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadiusGeometry.only(
                                        bottomRight: Radius.circular(
                                          14.r,
                                        ),
                                        topRight: Radius.circular(14.r),
                                      ),
                                      color: AppColors.white,
                                      border: Border.all(color: AppColors.redPinkMain)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsGeometry.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          vm.categories[index].title,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color:
                                            AppColors.backgroundBeige,
                                          ),
                                        ),
                                        Text(
                                          vm.categories[index].description,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 13,
                                            color:
                                            AppColors.backgroundBeige,
                                          ),
                                          maxLines: 2,
                                        ),
                                        Text(
                                          'By Chef ${vm.topChef[index].firstName}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                            color: AppColors.redPinkMain,
                                          ),
                                        ),
                                        Row(
                                          spacing: 15,
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/Icons/clock.svg',
                                                ),
                                                SizedBox(width: 6),
                                                Text(
                                                  vm
                                                      .categories[index]
                                                      .timeRequired
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color:
                                                    AppColors.pinkSub,
                                                  ),
                                                ),
                                                Text(
                                                  'min',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color:
                                                    AppColors.pinkSub,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              spacing: 3,
                                              children: [
                                                Text(
                                                  vm
                                                      .categories[index]
                                                      .difficulty
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color:
                                                    AppColors.pinkSub,
                                                  ),
                                                ),
                                                SvgPicture.asset(
                                                  'assets/Icons/def.svg',
                                                ),
                                              ],
                                            ),
                                            Row(
                                              spacing: 4,
                                              children: [
                                                Text(
                                                  vm
                                                      .categories[index]
                                                      .rating
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color:
                                                    AppColors.pinkSub,
                                                  ),
                                                ),
                                                SvgPicture.asset(
                                                  'assets/Icons/star.svg',
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                                                ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,

                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadiusGeometry.circular(14),
                                    child: Stack(
                                      children: [ Image.network(
                                        vm.categories[index].photo,
                                        width: 150.w,
                                        height: 150.h,
                                        fit: BoxFit.cover,
                                      ),
                                        Positioned(
                                          top: 7.h,
                                          left: 115.w,
                                          child: GestureDetector(
                                            onTap: () => vm.toggleLike(index),
                                            child: Container(
                                              width: 28.w,
                                              height: 28.h,
                                              decoration: BoxDecoration(
                                                color: vm.likedStates[index]
                                                    ? AppColors.redPinkMain
                                                    : AppColors.pink,
                                                shape: BoxShape.circle,
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/Icons/like.svg',
                                                width: 15.w,
                                                height: 15.h,
                                                fit: BoxFit.none,
                                                color: vm.likedStates[index]
                                                    ? AppColors.white
                                                    : AppColors.pinkSub,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
