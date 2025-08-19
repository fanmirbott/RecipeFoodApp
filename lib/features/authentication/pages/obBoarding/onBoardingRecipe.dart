import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/cleint.dart';
import 'package:recipefoodapp/data/repositories/onBoardingReposrtory.dart';
import 'package:recipefoodapp/features/authentication/pages/obBoarding/widgets/onboardingpage_text_button.dart';
import 'package:recipefoodapp/features/managers/OnBoardingProvider.dart';
import 'package:recipefoodapp/core/utils/Appcolors.dart';

class Onboardingrecipe extends StatefulWidget {
  const Onboardingrecipe({super.key});

  @override
  State<Onboardingrecipe> createState() => _OnboardingrecipeState();
}

class _OnboardingrecipeState extends State<Onboardingrecipe> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnBoardingProvider(OnBoardingRepository(ApiClient())),
      builder: (context, child) => Consumer<OnBoardingProvider>(
        builder: (context, vm, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Appcolors().backgroundBegie,
            leading: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/Icons/back-arrow.svg"),
            ),
          ),
          body: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 37),
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    width: 356.w,
                    height: 300.h,
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: vm.recipe.length,
                      itemBuilder: (context, index) => ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(14),
                        child: Image.network(
                          vm.recipe[index]['image'], width: 166.w, height: 168.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                    ),
                  )
                ),
                SizedBox(height: 5.h,),
                SizedBox(
                  width: 356.w,
                  height: 92.h,
                  child: Column(
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          color: Appcolors().white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        'Find the best recipes that the world can provide you also with every step that you can learn to increase your cooking skills.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Appcolors().white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 13.h,),
                OnboardingpageTextButton(onPressed: () {
                  context.push('/onBoarding');
                }, text: 'I’m New'),
                SizedBox(height: 20.h,),
                OnboardingpageTextButton(onPressed: () {
                  context.push('/categories');
                }, text: 'I’ve been here '),
                SizedBox(height: 35.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
