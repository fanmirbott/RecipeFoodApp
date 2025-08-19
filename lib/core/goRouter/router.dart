import 'package:go_router/go_router.dart';
import 'package:recipefoodapp/features/home/recipes/pages/ReviewsPage.dart';

import '../../features/authentication/pages/homePage/HomePage.dart';
import '../../features/authentication/pages/loginPage/pages/LoginPage.dart';
import '../../features/authentication/pages/loginPage/pages/SignUpPage.dart';
import '../../features/authentication/pages/loginPage/pages/otp_digit_field.dart';
import '../../features/authentication/pages/loginPage/pages/send_otp_page.dart';
import '../../features/authentication/pages/obBoarding/OnBoardingPage.dart';
import '../../features/authentication/pages/obBoarding/onBoardingPage.dart';
import '../../features/authentication/pages/obBoarding/onBoardingRecipe.dart';
import '../../features/authentication/pages/topChef/ChefsDetailPage.dart';
import '../../features/authentication/pages/topChef/TopChefPage.dart';
import '../../features/authentication/pages/trenndingPage/trendingPage.dart';
import '../../features/home/recipes/pages/CategoriesPage.dart';
import '../../features/home/recipes/pages/RecipeDetail.dart';
import '../../features/home/recipes/pages/RecipePage.dart';

final GoRouter router = GoRouter(
  initialLocation: '/topChef',
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
      path: '/topChef',
      builder: (context, state) => TopChefPage(),
    ),
    GoRoute(
      path: '/chefDetail/:id',
      builder: (context, state) => ChefsDetailPage(
        id: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: '/trending',
      builder: (context, state) => TrendingPage(),
    ),
    GoRoute(
      path: '/homePage',
      builder: (context, state) => HomePage(),
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
    GoRoute(
      path: '/recipe/:id',
      builder: (context, state) => RecipeDetail(
        id: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: 'reviewsPage',
      builder: (context, state) => ReviewsPage(),
    ),
  ],
);
