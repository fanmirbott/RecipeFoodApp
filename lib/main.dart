import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipefoodapp/utils/Appcolors.dart';

import 'features/recipes/pages/CategoriesPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Appcolors().backgroundBegie),
        debugShowCheckedModeBanner: false,
        home: CategoriesPage(),
      ),
    );
  }
}
