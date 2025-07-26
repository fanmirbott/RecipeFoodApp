import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const RecipeAppBar({super.key});

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
      title: Text(
        "Categories",
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
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 56);
}
