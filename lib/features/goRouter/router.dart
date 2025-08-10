import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipefoodapp/features/home/recipes/pages/obBoarding/OnBoardingPage.dart';
import 'package:recipefoodapp/features/home/recipes/pages/obBoarding/onBoardingRecipe.dart';

import '../home/recipes/pages/CategoriesPage.dart';
import '../home/recipes/pages/RecipePage.dart';
import '../home/recipes/pages/obBoarding/onBoardingPage.dart';

final GoRouter router = GoRouter(
  initialLocation: '/onBoardingPage',
  routes: [
    GoRoute(
      path: '/onBoarding',
      builder: (context, state) => PageViewOnBoarding(),
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
