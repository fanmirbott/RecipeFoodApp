import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipefoodapp/features/recipes/pages/CategoriesPage.dart';
import 'package:recipefoodapp/features/recipes/pages/RecipePage.dart';

final GoRouter router = GoRouter(
  initialLocation: '/categories',
  routes: [
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

