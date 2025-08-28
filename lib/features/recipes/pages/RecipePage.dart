import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/features/common/appBar/app_bar_home.dart';
import 'package:recipefoodapp/features/common/bottomNavigationBar/bottom_nav_bar.dart';
import 'package:recipefoodapp/core/network/cleint.dart';
import 'package:recipefoodapp/core/router/routerName.dart';
import 'package:recipefoodapp/data/repositories/recipe/categories_detail_repostory.dart';
import '../../common/appBar/recipeBottomCategoryBar.dart';
import '../../../../core/utils/Appcolors.dart';
import '../managers/CategoriesDetailViewModel.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key, required this.title, required this.categoryId});

  final String title;
  final int categoryId;

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoriesProviderDetail(
        categoryId: widget.categoryId,
        repository: CategoriesDetailRepository(client: ApiClient()),
      ),
      builder: (context, child) => Scaffold(
        extendBody: true,
        appBar: AppBarHome(title: widget.title, bottom: RecipeAppBarBottom()),
        bottomNavigationBar: BottomNavBar(),
        body: Consumer<CategoriesProviderDetail>(
          builder: (context, vm, child) {
            if (vm.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (vm.productsDetail.isEmpty) {
              return Center(
                child: Text(
                  "Bu kategoriyada ovqatlar topilmadi.",
                  style: TextStyle(color: Appcolors().white),
                ),
              );
            }
            return GridView.builder(
              padding: EdgeInsets.only(
                left: 37.w,
                right: 37.w,
                bottom: 100.h,
                top: 20.h,
              ),
              itemCount: vm.productsDetail.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 168.w,
                  height: 226.h,
                  child: GestureDetector(
                    onTap: () {
                      context.push(
                        Routers.recipe,
                        extra: vm.productsDetail[index].id,
                      );
                    },
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
                              border: Border.all(
                                color: Theme.of(context).colorScheme.secondary
                              )
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
                                    vm.productsDetail[index].title,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Appcolors().brownLetters,
                                    ),
                                  ),
                                  Text(
                                    vm.productsDetail[index].description,
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
                                            vm.productsDetail[index].rating
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
                                            vm
                                                .productsDetail[index]
                                                .timeRequired
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
                            vm.productsDetail[index].photo,
                            width: 169.w,
                            height: 153.h,
                            fit: BoxFit.cover,
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
                crossAxisSpacing: 10,
                mainAxisExtent: 226.h,
              ),
            );
          },
        ),
      ),
    );
  }
}
