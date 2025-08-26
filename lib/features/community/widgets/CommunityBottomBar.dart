import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';

class CommunityBottomBar extends StatefulWidget implements PreferredSizeWidget {
  const CommunityBottomBar({super.key});

  @override
  Size get preferredSize => Size(double.infinity, 40.h);

  @override
  State<CommunityBottomBar> createState() => _CommunityBottomBarState();
}

class _CommunityBottomBarState extends State<CommunityBottomBar> {
  List items = ['Top Recipes', 'Newest', 'Oldest'];
  List categoryItems = ['Top', 'New', 'Old'];
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Row(
            spacing: 35,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(items.length, (index) {
                return GestureDetector(
                  onTap: () {
                    isSelected = index;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 15,
                    ),
                    height: 25.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19.r),
                      color: isSelected == index
                          ? Appcolors().redpinkmain
                          : Appcolors().transparent,
                    ),
                    child: Text(
                      items[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: isSelected == index
                            ? Appcolors().white
                            : Appcolors().redpinkmain,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
          SizedBox(height: 10.h,)
        ],
      ),
    );
  }
}
