import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/appDetails/bottom_nav_bar.dart';
import 'package:recipefoodapp/features/recipes/pages/RecipeDetail.dart';
import '../../../core/appDetails/recipeBottomCategoryBar.dart';
import '../../../utils/Appcolors.dart';
import '../../onBoarding/managers/CategoriesDetailProvider.dart';

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
      create: (context) =>
          Categories_provider_Detail(categoryId: widget.categoryId),
      builder: (context, child) => Scaffold(
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
            widget.title,
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
          bottom: RecipeAppBarBottom(),
        ),
        bottomNavigationBar: BottomNavBar(),
        body: Consumer<Categories_provider_Detail>(
          builder: (context, vm, child) {
            if (vm.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (vm.productsDetail.isEmpty) {
              return Center(child: Text("Bu kategoriyada ovqatlar topilmadi."));
            }
            return GridView.builder(
              padding: EdgeInsets.only(left: 37.w, right: 37.w, bottom: 100.h, top: 20.h),
              itemCount: vm.productsDetail.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 168.w,
                  height: 226.h,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetail(
                            id: vm.productsDetail[index].id,
                          ),
                        ),
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
                                            vm.productsDetail[index].timeRequired
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
