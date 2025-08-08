import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../home/recipes/pages/CategoriesPage.dart';
import '../home/recipes/pages/RecipePage.dart';
import '../home/recipes/pages/obBoarding/onBoardingPage.dart';

final GoRouter router = GoRouter(
  initialLocation: '/onBoarding',
  routes: [
    GoRoute(path: '/onBoarding', builder: (context, state) => PageViewOnBoarding(),),
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

