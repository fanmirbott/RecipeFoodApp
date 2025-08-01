import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodapp/feature/page/categories/categories_page.dart';

import '../../utils/colors.dart';
class RecipeAppBar extends StatefulWidget implements PreferredSizeWidget{
  const RecipeAppBar({super.key});

  @override
  State<RecipeAppBar> createState() => _RecipeAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, 56);
}

class _RecipeAppBarState extends State<RecipeAppBar> {
  
  int activIndex = 0;

  List<String> titleAppBar = [
    "Breakfast",
    "Lunch",
    "Dinnar",
    "Vegan",
    "Dessert",
    "Drinks",
  ];

  List<String> tabBar = [
    "Breakfast",
    "Lunch",
    "Dinnar",
    "Vegan",
    "Dessert",
    "Drinks",
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF1C0F0D),
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(left: 27),
        onPressed: () {
          Navigator.pop(context );
        },
        icon: SvgPicture.asset("assets/Icons/back-arrow.svg"),
      ),
      centerTitle: true,
      title: Text("Categories",
            style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: Color(0xFFFD5D69),
            ),
      ),
      actions: [
        IconButton(
          style: IconButton.styleFrom(
            fixedSize: Size(28, 28),
            backgroundColor: Color(0xFFFFC6C9),
          ),
          onPressed: () {},
          icon: SvgPicture.asset("assets/Icons/notification.svg"),
        ),
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            fixedSize: Size(28, 28),
            backgroundColor: Color(0xFFFFC6C9),
          ),
          icon: SvgPicture.asset("assets/Icons/search.svg"),
        ),
        SizedBox(width: 27),
      ],
      bottom: PreferredSize(preferredSize: Size(double.infinity, 39), child:
      SizedBox(
        width: 405.w,
        height: 35.h,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 19.w,
            children: [
              ...List.generate(tabBar.length, (index) {
                return TextButton(
                  onPressed: () {
                    activIndex = index;
                    setState(() {});
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size(0, 35),
                    backgroundColor: activIndex == index
                        ? colors().tabBar
                        : Colors.transparent,
                  ),
                  child: SizedBox(
                    height: 35,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        tabBar[index],
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: activIndex == index
                              ? colors().colorsWhite
                              : colors().tabBar,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      )),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 56);
}
