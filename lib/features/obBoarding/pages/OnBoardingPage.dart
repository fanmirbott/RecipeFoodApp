import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/network/cleint.dart';
import 'package:recipefoodapp/data/repositories/onBoardingReposrtory.dart';
import 'package:recipefoodapp/features/obBoarding/managers/OnBoardingProvider.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';

import '../widgets/onboardingpage_text_button.dart';

class Onboardingpage extends StatefulWidget {
  const Onboardingpage({super.key});

  @override
  State<Onboardingpage> createState() => _OnboardingpageState();
}

class _OnboardingpageState extends State<Onboardingpage> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnBoardingProvider(OnBoardingRepository(ApiClient())),
      builder: (context, child) => Consumer<OnBoardingProvider>(
        builder: (context, vm, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Appcolors().backgroundBegie,
          ),
          body: PageView.builder(
            controller: controller,
            itemCount: vm.onBoarding.length,
            itemBuilder: (context, index) => Column(
              children: [
                SizedBox(
                  width: 430.w,
                  height: 64.h,
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 37.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vm.onBoarding[index]['title'],
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Appcolors().white,
                          ),
                        ),
                        Text(
                          vm.onBoarding[index]['subtitle'],
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Appcolors().white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 23.h,
                ),
                SizedBox(
                  width: 430.w,
                  height: 739.h,
                  child: Stack(
                    children: [
                      Image.network(
                        vm.onBoarding[index]['image'],
                        width: double.infinity,
                        height: 739.h,
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 430.w,
                          height: 284.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Appcolors().backgroundBegie,
                                Colors.transparent,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 430.w,
                          height: 284.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Appcolors().backgroundBegie,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 48.h,
                        left: 117,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: OnboardingpageTextButton(
                            onPressed: () {
                              if (index < vm.onBoarding.length - 1) {
                                controller.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                context.go('/onBoardingRecipe');
                              }
                            },
                            text: 'Continue',
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
