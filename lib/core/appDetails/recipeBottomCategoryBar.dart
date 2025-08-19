import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';
import 'package:recipefoodapp/features/managers/CategoriesDetailViewModel.dart';

class RecipeAppBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const RecipeAppBarBottom({super.key});

  @override
  Size get preferredSize => Size.fromHeight(45.h);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesProviderDetail>(
      builder: (context, vm, child) {
        if (vm.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (vm.categories.isEmpty) {
          return Text('''categoriya bo'sh''', style: TextStyle(color: Appcolors().white),);
        }
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
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
                    vm.getCategoriesDetail();
                    vm.categoryId = item['id'];
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8.w),
                    padding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: vm.categoryId == item['id']
                          ? Appcolors().redpinkmain
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: Text(
                      item['title'],
                      style: TextStyle(
                        color: vm.categoryId == item['id']
                            ? Colors.white
                            : Appcolors().redpinkmain,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
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
