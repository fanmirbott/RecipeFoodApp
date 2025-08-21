import 'package:go_router/go_router.dart';
import 'package:recipefoodapp/core/router/routerName.dart';
import 'package:recipefoodapp/features/authentication/pages/homePage/pages/yourRecipe/pages/yourRecipePage.dart';
import 'package:recipefoodapp/features/home/recipes/pages/ReviewsPage.dart';
import '../../features/authentication/pages/categories/pages/CategoriesPage.dart';
import '../../features/authentication/pages/homePage/pages/HomePage.dart';
import '../../features/authentication/pages/loginPage/pages/LoginPage.dart';
import '../../features/authentication/pages/loginPage/pages/SignUpPage.dart';
import '../../features/authentication/pages/loginPage/pages/otp_digit_field.dart';
import '../../features/authentication/pages/loginPage/pages/send_otp_page.dart';
import '../../features/authentication/pages/obBoarding/OnBoardingPage.dart';
import '../../features/authentication/pages/obBoarding/onBoardingPage.dart';
import '../../features/authentication/pages/obBoarding/onBoardingRecipe.dart';
import '../../features/authentication/pages/topChef/pages/ChefsDetailPage.dart';
import '../../features/authentication/pages/topChef/pages/TopChefPage.dart';
import '../../features/authentication/pages/trenndingPage/trendingPage.dart';
import '../../features/home/recipes/pages/RecipeDetail.dart';
import '../../features/home/recipes/pages/RecipePage.dart';

final GoRouter router = GoRouter(
  initialLocation: Routers.homePage,
  routes: [
    GoRoute(
      path: Routers.onBoarding,
      builder: (context, state) => PageViewOnBoarding(),
    ),
    GoRoute(
      path: Routers.otpDigitField,
      builder: (context, state) => OtpDigitField(),
    ),
    GoRoute(
      path: Routers.sendOtpPage,
      builder: (context, state) => SendOtpPage(),
    ),
    GoRoute(
      path: Routers.loginPage,
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: Routers.signUpPage,
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: Routers.onBoardingRecipe,
      builder: (context, state) => Onboardingrecipe(),
    ),
    GoRoute(
      path: Routers.onBoardingPage,
      builder: (context, state) => Onboardingpage(),
    ),
    GoRoute(
      path: Routers.categories,
      builder: (context, state) => CategoriesPage(),
    ),
    GoRoute(
      path: Routers.topChef,
      builder: (context, state) => TopChefPage(),
    ),
    GoRoute(
      path: Routers.chefDetail,
      builder: (context, state) => ChefsDetailPage(

      ),
    ),
    GoRoute(
      path: Routers.trending,
      builder: (context, state) => TrendingPage(),
    ),
    GoRoute(
      path: Routers.homePage,
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: Routers.recipePage,
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return RecipesPage(
          categoryId: data['id'],
          title: data['title'],
        );
      },
    ),
    GoRoute(
      path: Routers.recipe,
      builder: (context, state) => RecipeDetail(
        id: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: Routers.reviewsPage,
      builder: (context, state) => ReviewsPage(id: int.parse(state.pathParameters['id']!),),
    ),
    GoRoute(path: Routers.yourRecipe,
    builder: (context, state) => YourRecipePage(),)
  ],
);
