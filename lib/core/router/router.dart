import 'package:go_router/go_router.dart';
import 'package:recipefoodapp/core/router/routerName.dart';
import 'package:recipefoodapp/features/profile/profile.dart';
import '../../features/authentication/pages/loginPage/pages/LoginPage.dart';
import '../../features/authentication/pages/loginPage/pages/SignUpPage.dart';
import '../../features/authentication/pages/loginPage/pages/otp_digit_field.dart';
import '../../features/authentication/pages/loginPage/pages/send_otp_page.dart';
import '../../features/categories/pages/CategoriesPage.dart';
import '../../features/community/pages/CommunityPage.dart';
import '../../features/home/pages/HomePage.dart';
import '../../features/obBoarding/pages/LaunchPage.dart';
import '../../features/obBoarding/pages/OnBoardingPage.dart';
import '../../features/obBoarding/pages/onBoardingPage.dart';
import '../../features/obBoarding/pages/onBoardingRecipe.dart';
import '../../features/recipes/pages/RecipeDetail.dart';
import '../../features/recipes/pages/RecipePage.dart';
import '../../features/recipes/pages/ReviewsPage.dart';
import '../../features/topChef/pages/ChefsDetailPage.dart';
import '../../features/topChef/pages/TopChefPage.dart';
import '../../features/trenndingPage/pages/trendingPage.dart';
import '../../features/yourRecipe/pages/yourRecipePage.dart';

final GoRouter router = GoRouter(
  initialLocation: Routers.launchPage,
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
      builder: (context, state) => ChefsDetailPage(),
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
      builder: (context, state) {
        final id = state.extra as int;
        return RecipeDetail(id: id);
      },
    ),

    GoRoute(
      path: Routers.reviewsPage,
      builder: (context, state) => ReviewsPage(
        id: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: Routers.yourRecipe,
      builder: (context, state) => YourRecipePage(),
    ),
    GoRoute(
      path: Routers.community,
      builder: (context, state) => CommunityPage(),
    ),
    GoRoute(
      path: Routers.launchPage,
      builder: (context, state) => LaunchPage(),
    ),
    GoRoute(
      path: Routers.profilePage,
      builder: (context, state) => ProfilePage(),
    ),
  ],
);
