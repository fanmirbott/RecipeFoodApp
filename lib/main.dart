import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/network/cleint.dart';
import 'package:recipefoodapp/core/utils/AppTheme.dart';
import 'package:recipefoodapp/core/utils/provider.dart';
import 'package:recipefoodapp/data/repositories/Auth/AuthenticationRepository.dart';
import 'package:recipefoodapp/data/repositories/categories/categoriesRepostory.dart';
import 'package:recipefoodapp/data/repositories/recipe/categories_detail_repostory.dart';
import 'package:recipefoodapp/data/repositories/chef/chefDetailRepostory.dart';
import 'package:recipefoodapp/features/topChef/managers/chefDetailViewModel.dart';
import 'core/router/router.dart';
import 'features/authentication/managers/AuthentictacionViewModel.dart';
import 'features/authentication/pages/LoginPage.dart';

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
          ChangeNotifierProvider(
            create: (context) => LoginViewModel(context.read<AuthenticationRepository>()),
            child: LoginPage(),
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
              themeMode: isDarkMode ? ThemeMode.light : ThemeMode.dark,
              debugShowCheckedModeBanner: false,
              routerConfig: router,
            );
          },
        ),
      ),
    );
  }
}
