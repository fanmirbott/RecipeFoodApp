import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/features/common/appBar/app_bar_home.dart';
import 'package:recipefoodapp/features/common/bottomNavigationBar/bottom_nav_bar.dart';
import 'package:recipefoodapp/core/cleint.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';
import 'package:recipefoodapp/data/repositories/recipe/recipe_detail_repostory.dart';
import '../../../core/utils/theme_view_model.dart';
import '../managers/RecipeDetailViewModel.dart';
import 'ReviewsPage.dart';

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({super.key, required this.id});

  final int id;

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  String gmail = '@';

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeDetailViewModel(
        id: widget.id,
        repository: RecipeDetailRepository(ApiClient()),
      ),
      builder: (context, child) => Consumer<RecipeDetailViewModel>(
        builder: (context, vm, child) {
          if (vm.recipeData == null) {
            return Align(
              alignment: Alignment.center,
              child: Text(
                'Malumotlar Topilmadi',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            );
          }
          if (vm.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final theme = context.watch<ThemeViewModel>().isDarkTheme;
          final recipe = vm.recipeData!;
          return Scaffold(
            extendBody: true,
            appBar: AppBarHome(title: recipe['title'], bottom: null),
            bottomNavigationBar: BottomNavBar(),
            body: vm.isLoading
                ? Center(
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
                                      borderRadius:
                                          BorderRadiusGeometry.circular(
                                            10,
                                          ),
                                      color: AppColors.redPinkMain,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          recipe['title'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: AppColors.white,
                                          ),
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ReviewsPage(
                                                      id: vm.id,
                                                    ),
                                              ),
                                            );
                                          },
                                          child: Row(
                                            spacing: 4,
                                            children: [
                                              SvgPicture.asset(
                                                "assets/Icons/star.svg",
                                                width: 10.w,
                                                height: 10.h,
                                                color: AppColors.white,
                                              ),
                                              Text(
                                                recipe['rating'].toString(),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Row(
                                          spacing: 4,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/Icons/reviews.svg",
                                              width: 10.w,
                                              height: 10.h,
                                              color: AppColors.white,
                                            ),
                                            Text(
                                              recipe['reviewsCount'].toString(),
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    10,
                                  ),
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        recipe['photo'],
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
                                                AppColors.redPinkMain,
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
                                    recipe['user']['profilePhoto'],
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
                                            color: AppColors.redPinkMain,
                                          ),
                                        ),
                                        Text(
                                          recipe['user']['username'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: AppColors.redPinkMain,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          recipe['user']['firstName'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 11,
                                            color: Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        SizedBox(width: 2.w),
                                        Text(
                                          recipe['user']['lastName'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 11,
                                            color: Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        Text(
                                          '-chef',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 11,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                TextButton(
                                  onPressed: () {
                                    isSelected = !isSelected;
                                    setState(() {});
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    fixedSize: Size(109.09.w, 21.h),
                                    minimumSize: Size(109.09.w, 21.h),
                                    backgroundColor: isSelected
                                        ? AppColors.pinkSub
                                        : AppColors.pink,
                                  ),
                                  child: Text(
                                    isSelected ? 'Unfollow' : 'Following',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: isSelected
                                          ? AppColors.pink
                                          : AppColors.pinkSub,
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
                          Divider(color: AppColors.pinkSub),
                          SizedBox(height: 31.h),
                          Row(
                            spacing: 4,
                            children: [
                              Text(
                                'Details',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: AppColors.redPinkMain,
                                ),
                              ),
                              SizedBox(width: 11.h),
                              SvgPicture.asset(
                                'assets/Icons/clock.svg',
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.primary,
                                  BlendMode.srcIn,
                                ),
                              ),
                              Text(
                                recipe['timeRequired'].toString(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                'min',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 36,
                            child: Text(
                              recipe['instructions'][0]['text'],
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Theme.of(context).primaryColor,
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
                                color: AppColors.redPinkMain,
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
                                itemCount: recipe['ingredients'].length,
                                itemBuilder: (context, index) {
                                  final ingredient =
                                      recipe['ingredients'][index];
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 2.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          ingredient['amount'],
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.redPinkMain
                                          ),
                                        ),
                                        Text(
                                          ingredient['name'],
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Theme.of(context).primaryColor
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                padding: EdgeInsetsGeometry.only(bottom: 100),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
