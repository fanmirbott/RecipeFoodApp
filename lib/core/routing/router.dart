import 'package:go_router/go_router.dart';
import 'package:recipefoodapp/core/routing/routes.dart';
import 'package:recipefoodapp/features/home/pages/HomePage.dart';
import 'package:recipefoodapp/features/profile/pages/add_recipe_page.dart';
import 'package:recipefoodapp/features/profile/pages/notification_page.dart';
import 'package:recipefoodapp/features/profile/pages/profilePage.dart';
import 'package:recipefoodapp/features/profile/pages/profile_menu_page.dart';
import 'package:recipefoodapp/features/splashPage/splash.dart';
import '../../features/authentication/pages/LoginPage.dart';
import '../../features/authentication/pages/SignUpPage.dart';
import '../../features/authentication/pages/otp_digit_field.dart';
import '../../features/authentication/pages/send_otp_page.dart';
import '../../features/categories/pages/CategoriesPage.dart';
import '../../features/community/pages/CommunityPage.dart';
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

final router = GoRouter(
  initialLocation: Routes.splashPage,
  routes: [
    GoRoute(
      path: Routes.onBoarding,
      builder: (context, state) => PageViewOnBoarding(),
    ),
    GoRoute(
      path: Routes.otpDigitField,
      builder: (context, state) => OtpDigitField(),
    ),
    GoRoute(
      path: Routes.sendOtpPage,
      builder: (context, state) => SendOtpPage(),
    ),
    GoRoute(
      path: Routes.loginPage,
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: Routes.signUpPage,
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: Routes.onBoardingRecipe,
      builder: (context, state) => OnBoardingRecipe(),
    ),
    GoRoute(
      path: Routes.onBoardingPage,
      builder: (context, state) => Onboardingpage(),
    ),
    GoRoute(
      path: Routes.categories,
      builder: (context, state) => CategoriesPage(),
    ),
    GoRoute(
      path: Routes.topChef,
      builder: (context, state) => TopChefPage(),
    ),
    GoRoute(
      path: Routes.chefDetail,
      builder: (context, state) => ChefsDetailPage(),
    ),
    GoRoute(
      path: Routes.trending,
      builder: (context, state) => TrendingPage(),
    ),
    GoRoute(
      path: Routes.homePage,
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: Routes.recipePage,
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return RecipesPage(
          categoryId: data['id'],
          title: data['title'],
        );
      },
    ),
    GoRoute(
      path: Routes.recipe,
      builder: (context, state) {
        final id = state.extra as int;
        return RecipeDetail(id: id);
      },
    ),

    GoRoute(
      path: Routes.reviewsPage,
      builder: (context, state) => ReviewsPage(
        id: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: Routes.yourRecipe,
      builder: (context, state) => YourRecipePage(),
    ),
    GoRoute(
      path: Routes.community,
      builder: (context, state) => CommunityPage(),
    ),
    GoRoute(
      path: Routes.launchPage,
      builder: (context, state) => LaunchPage(),
    ),
    GoRoute(
      path: Routes.profilePage,
      builder: (context, state) => ProfilePage(),
    ),
    GoRoute(
      path: Routes.profileMenu,
      builder: (context, state) => ProfileMenuPage(),
    ),
    GoRoute(
      path: Routes.splashPage,
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: Routes.addRecipe,
      builder: (context, state) => AddRecipePage(),
    ),
    GoRoute(
      path: Routes.notificationPage,
      builder: (context, state) => NotificationPage(),
    ),
  ],
);
