import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/utils/Appcolors.dart';

import '../../features/onBoarding/managers/CategoriesDetailProvider.dart';
import '../../features/recipes/pages/RecipePage.dart';

class RecipeAppBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const RecipeAppBarBottom({super.key});

  @override
  Size get preferredSize => Size.fromHeight(45.h);

  @override
  Widget build(BuildContext context) {
    return Consumer<Categories_provider_Detail>(
      builder: (context, vm, child) {
        if (vm.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 10),
          child: Container(
            height: 25.h,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: vm.categories.length,
              itemBuilder: (context, index) {
                final item = vm.categories[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipesPage(
                          title: vm.categories[index]['title'],
                          categoryId: vm.categories[index]['id'],
                        ),
                      ),
                    );
                    final selectedCategoryId = vm.categories[index]['id'];
                    vm.categoryId = selectedCategoryId;
                    vm.getCategoriesDetail();
                  },
                  child: Container(
                    height: 25.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: vm.categoryId == vm.categories[index]['id']
                          ? Appcolors().redpinkmain
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: Padding(
                      padding: EdgeInsetsGeometry.only(left: 10, right: 10),
                      child: Text(
                        item['title'],
                        style: TextStyle(
                          color: vm.categoryId == vm.categories[index]['id']
                              ? Colors.white
                              : Appcolors().redpinkmain,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
