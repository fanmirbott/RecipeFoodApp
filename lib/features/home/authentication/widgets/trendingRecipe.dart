import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/cleint.dart';
import '../../../../core/utils/Appcolors.dart';
import '../../../../data/repositories/trendingRecipeRepostory.dart';
import '../../../managers/TrendingRecipeViewModel.dart';

class TrendingRecipe extends StatefulWidget {
  const TrendingRecipe({super.key});

  @override
  State<TrendingRecipe> createState() => _TrendingRecipeState();
}

class _TrendingRecipeState extends State<TrendingRecipe> {
  bool like = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TrendingViewModel(
        TrendingRepository(client: ApiClient()),
      ),
      child: Consumer<TrendingViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.trendingRecipe == null) {
            return Center(
              child: Text(
                "Ma'lumot topilmadi",
                style: TextStyle(fontSize: 20, color: Appcolors().white),
              ),
            );
          }
          final recipe = vm.trendingRecipe!;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trending Recipe',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Appcolors().redpinkmain,
                  ),
                ),
                SizedBox(height: 9.h),
                GestureDetector(
                  onTap: (){
                    context.push('/trending');
                  },
                  child: SizedBox(
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
                              border: Border.all(color: Appcolors().pinkSub),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 265.31.w,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        recipe.title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          color: Appcolors().white,
                                        ),
                                      ),
                                      Text(
                                        recipe.description,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 13,
                                          color: Appcolors().white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                          ? Appcolors().redpinkmain
                                          : Appcolors().pink,
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/Icons/like.svg',
                                      width: 15.w,
                                      height: 15.h,
                                      fit: BoxFit.none,
                                      color: like
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
