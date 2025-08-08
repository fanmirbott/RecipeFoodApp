import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipefoodapp/utils/Appcolors.dart';
import 'features/goRouter/router.dart';

void main() {
  runApp(MyApp());
}

// final router = GoRouter(routes: [
//   GoRoute(path: '/categories', builder: (context, state) => CategoriesPage(),),
//   GoRoute(path: '/recipe', builder: (context, state) => RecipesPage(),)
// ]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MaterialApp.router(
        theme: ThemeData(scaffoldBackgroundColor: Appcolors().backgroundBegie),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
