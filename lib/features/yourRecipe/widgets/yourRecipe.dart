import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/cleint.dart';
import 'package:recipefoodapp/data/repositories/recipe/yourRecipeRepostory.dart';
import '../../../../../../../core/utils/Appcolors.dart';
import '../../../core/routing/routes.dart';
import '../managers/YourRecipeViewModel.dart';

class YourRecipes extends StatelessWidget {
  const YourRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => YourRecipeViewModel(YourRecipeRepository(ApiClient())),
      child: Consumer<YourRecipeViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.recipes.isEmpty) {
            return const Center(child: Text("Ma'lumot topilmadi"));
          }
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 14),
            width: 430.w,
            height: 255.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColors.redPinkMain,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your recipes',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors.white,
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
                          context.go(Routes.yourRecipe);
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
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                width: 168.52.w,
                                height: 48.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.r),
                                  color: AppColors.white,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      vm.recipes[index].title,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.backgroundBeige,
                                      ),
                                    ),
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
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.pinkSub,
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
                                              vm.recipes[index].timeRequired
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
          );
        },
      ),
    );
  }
}
