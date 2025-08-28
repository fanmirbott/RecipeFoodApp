import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/network/cleint.dart';
import 'package:recipefoodapp/data/repositories/chef/chefDetailRepostory.dart';
import 'package:recipefoodapp/data/repositories/chef/topChefRepostory.dart';
import 'package:recipefoodapp/features/topChef/managers/TopChefViewModel.dart';
import 'package:recipefoodapp/features/topChef/managers/chefDetailRecipeViewModel.dart';
import 'package:recipefoodapp/features/topChef/managers/chefDetailViewModel.dart';
import '../../../../../../core/utils/Appcolors.dart';
import '../../../data/repositories/recipe/categories_detail_repostory.dart';

class ChefRecipeGridView extends StatelessWidget {
  const ChefRecipeGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChefDetailRecipeViewModel(repository: ChefRepository(client: ApiClient()), userId: 1),
      builder: (context, child) => Consumer<ChefDetailRecipeViewModel>(
        builder: (context, vm, child) => Expanded(
          child: Padding(
            padding: EdgeInsetsGeometry.only(
              left: 36,
              right: 36,
            ),
            child: GridView.builder(
              padding: EdgeInsets.only(bottom: 100.h, top: 20.h),
              itemCount: vm.recipes.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 168.w,
                  height: 226.h,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 158.w,
                          height: 88.h,
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.r),
                            color: Appcolors().white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: 10.w,
                              left: 10.w,
                              top: 17.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  vm.recipes[index].title,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Appcolors().brownLetters,
                                  ),
                                ),
                                Text(
                                  vm.recipes[index].description,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 13.w,
                                    fontWeight: FontWeight.w300,
                                    color: Appcolors().brownLetters,
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
                                            color: Appcolors().pinkSub,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(width: 4.w),
                                        SvgPicture.asset(
                                          'assets/Icons/star.svg',
                                          width: 10.w,
                                          height: 10.h,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/Icons/clock.svg',
                                          width: 10.w,
                                          height: 10.h,
                                        ),
                                        SizedBox(width: 4.w),
                                        Text(
                                          vm.recipes[index].timeRequired
                                              .toString(),
                                          style: TextStyle(
                                            color: Appcolors().pinkSub,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          ' min',
                                          style: TextStyle(
                                            color: Appcolors().pinkSub,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
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
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14.r),
                        child: Image.network(
                          vm.recipes[index].photo,
                          width: 169.w,
                          height: 153.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 226.h,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
