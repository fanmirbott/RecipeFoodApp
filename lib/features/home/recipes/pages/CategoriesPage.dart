import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/appDetails/bottom_nav_bar.dart';
import 'package:recipefoodapp/utils/Appcolors.dart';

import '../../../managers/Categories_provider.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Categories_provider(),
      builder: (context, child) => Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Appcolors().backgroundBegie,
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/Icons/back-arrow.svg"),
          ),
          centerTitle: true,
          title: Text(
            "Category",
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
        ),
        bottomNavigationBar: BottomNavBar(),
        body: Consumer<Categories_provider>(
          builder: (context, vm, child) => GridView.builder(
            padding: EdgeInsets.only(
              right: 37.w,
              left: 37.w,
              bottom: 100.h,
              top: 10.h,
            ),
            itemCount: vm.products.length,
            itemBuilder: (context, index) => Stack(
              children: [
                Column(
                  spacing: 6,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.push(
                          '/recipePage',
                          extra: {
                            'id': vm.products[index].id,
                            'title': vm.products[index].title,
                          },
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.network(
                          vm.products[index].image,
                          width: 158.w,
                          height: 145.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Text(
                      vm.products[index].title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Appcolors().white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 172.h,
            ),
          ),
          child: Text("123"),
        ),
      ),
    );
  }
}
