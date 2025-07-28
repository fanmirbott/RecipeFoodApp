import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/feature/AppDetails/recipe_app_bar.dart';
import 'package:foodapp/feature/page/categories/categoriesPageDetail.dart';
import 'package:foodapp/feature/AppDetails/recipe_navigation_bar.dart';
import 'package:foodapp/utils/colors.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final List<String> items = [
    "assets/Images/Categories/lunch.png",
    "assets/Images/Categories/breakfast.png",
    "assets/Images/Categories/dinner.png",
    "assets/Images/Categories/vegan.png",
    "assets/Images/Categories/dessert.png",
    "assets/Images/Categories/drinks.png",
    "assets/Images/Categories/drinks.png",
    "assets/Images/Categories/drinks.png",
    "assets/Images/Categories/drinks.png",
    "assets/Images/Categories/drinks.png",
  ];
  final List<String> text = [
    "Breakfast",
    "Lunch",
    "Dinner",
    "Vegan",
    "Dessert",
    "Drinks",
    "Drinks",
    "Drinks",
    "Drinks",
    "Drinks",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: colors().FonColor,
      appBar: RecipeAppBar(),
      bottomNavigationBar: RecipeNavigationBar(),
      body: Padding(
        padding: EdgeInsets.only(right: 16.w, left: 16.w),
        child: GridView.builder(
          itemCount: items.length,
          padding: EdgeInsets.only(bottom: 80.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.h,
            crossAxisSpacing: 8.w,
          ),
          itemBuilder: (context, index) {
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.61.r),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoriesPageDetail(),
                        ),
                      );
                    },
                    child: Image.asset(
                      items[index],
                      width: 158.w,
                      height: 144.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  text[index],
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.61.sp,
                    color: Colors.white,
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
