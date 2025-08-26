import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/network/cleint.dart';
import 'package:recipefoodapp/core/utils/AppTheme.dart';
import 'package:recipefoodapp/core/utils/provider.dart';
import 'package:recipefoodapp/data/repositories/AuthenticationRepository.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';
import 'package:recipefoodapp/data/repositories/categoriesRepostory.dart';
import 'package:recipefoodapp/data/repositories/categories_detail_repostory.dart';
import 'package:recipefoodapp/data/repositories/chefDetailRepostory.dart';
import 'package:recipefoodapp/features/topChef/managers/chefDetailViewModel.dart';

import 'core/router/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MultiProvider(
        providers: [
          Provider(
            create: (context) => ApiClient(),
          ),
          Provider(
            create: (context) =>
                AuthenticationRepository(client: context.read()),
          ),
          Provider(
            create: (context) => CategoriesRepository(client: context.read()),
          ),
          Provider(
            create: (context) => CategoriesDetailRepository(
              client: context.read(),
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => ChefDetailViewModel(
              ChefDetailRepository(
                client: ApiClient(),
              ),
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => ThemeViewModel(),
          ),
        ],
        child: Builder(
          builder: (context) {
            bool isDarkMode = context.watch<ThemeViewModel>().isDarkTheme;
            return MaterialApp.router(
              theme: AppNight.theme,
              darkTheme: AppDark.theme,
              themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
              debugShowCheckedModeBanner: false,
              routerConfig: router,
            );
          },
        ),
      ),
    );
  }
}
