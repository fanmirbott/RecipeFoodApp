import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';
import '../widgets/AnimadietContainer.dart';
import 'AllergicPage.dart';
import 'CookingLevelPage.dart';
import 'PreferencesPage.dart';
class PageViewOnBoarding extends StatefulWidget {
  PageViewOnBoarding({super.key});

  @override
  State<PageViewOnBoarding> createState() => _PageViewOnBoarding();
}

class _PageViewOnBoarding extends State<PageViewOnBoarding> {
  final PageController _pageController = PageController();
  int isSelectPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Appcolors().backgroundBegie,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset("assets/Icons/back-arrow.svg"),
        ),
      ),
      body: Column(
        children: [
          PreferencesPageAnimatedContainer(pageIndex: isSelectPage),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  isSelectPage = index;
                });
              },
              children: [
                CookingLevelPage(controller: _pageController),
                PreferencesPage(controller: _pageController),
                Allergicpage(controller: _pageController),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
