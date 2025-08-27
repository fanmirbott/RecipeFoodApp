import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/features/common/bottomNavigationBar/bottom_nav_bar.dart';
import 'package:recipefoodapp/core/network/cleint.dart';
import 'package:recipefoodapp/core/router/routerName.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';
import 'package:recipefoodapp/data/repositories/categoriesRepostory.dart';
import 'package:recipefoodapp/features/common/appBar/app_bar_home.dart';

import '../managers/Categories_provider.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoriesViewModel(CategoriesRepository(client: ApiClient())),
      builder: (context, child) => Scaffold(
        extendBody: true,
        appBar: AppBarHome(title: 'Category', bottom: null,),
        bottomNavigationBar: BottomNavBar(),
        body: Consumer<CategoriesViewModel>(
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
                          Routers.recipePage,
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
                        color: Theme.of(context).primaryColor,
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
