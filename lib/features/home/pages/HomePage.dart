import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/network/cleint.dart';
import 'package:recipefoodapp/data/repositories/home/homePageRepostory.dart';
import 'package:recipefoodapp/features/home/managers/HomePageViewModel.dart';
import '../../common/bottomNavigationBar/bottom_nav_bar.dart';
import '../../common/appBar/AppBarHome.dart';
import '../../topChef/widgets/topChef.dart';
import '../../yourRecipe/widgets/yourRecipe.dart';
import '../widgets/recentlyAdded.dart';
import '../widgets/trendingRecipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageViewModel(HomePageRepository(ApiClient())),
      child: Consumer<HomePageViewModel>(
        builder: (context, vm, child) => Scaffold(
          extendBody: true,
          appBar: AppBarHomePage(),
          bottomNavigationBar: BottomNavBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                TrendingRecipe(),
                SizedBox(height: 19.h),
                YourRecipes(),
                SizedBox(height: 19.h),
                TopChef(),
                SizedBox(height: 19.h),
                RecentlyAdded(),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
