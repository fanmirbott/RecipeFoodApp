import 'package:go_router/go_router.dart';
import 'package:recipefoodapp/features/home/authentication/pages/loginPage/pages/send_otp_page.dart';
import 'package:recipefoodapp/features/home/authentication/pages/loginPage/pages/otp_digit_field.dart';
import 'package:recipefoodapp/features/home/authentication/pages/loginPage/pages/LoginPage.dart';
import 'package:recipefoodapp/features/home/authentication/pages/loginPage/pages/SignUpPage.dart';
import '../home/authentication/pages/obBoarding/OnBoardingPage.dart';
import '../home/authentication/pages/obBoarding/onBoardingPage.dart';
import '../home/authentication/pages/obBoarding/onBoardingRecipe.dart';
import '../home/recipes/pages/CategoriesPage.dart';
import '../home/recipes/pages/RecipePage.dart';

final GoRouter router = GoRouter(
  initialLocation: '/loginPage',
  routes: [
    GoRoute(
      path: '/onBoarding',
      builder: (context, state) => PageViewOnBoarding(),
    ),
    GoRoute(
      path: '/OtpDigitField',
      builder: (context, state) => OtpDigitField(),
    ),
    GoRoute(
      path: '/SendOtpPage',
      builder: (context, state) => SendOtpPage(),
    ),
    GoRoute(
      path: '/loginPage',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/signUpPage',
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: '/onBoardingRecipe',
      builder: (context, state) => Onboardingrecipe(),
    ),
    GoRoute(
      path: '/onBoardingPage',
      builder: (context, state) => Onboardingpage(),
    ),
    GoRoute(
      path: '/categories',
      builder: (context, state) => CategoriesPage(),
    ),
    GoRoute(
      path: '/recipePage',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return RecipesPage(
          categoryId: data['id'],
          title: data['title'],
        );
      },
    ),
  ],
);
