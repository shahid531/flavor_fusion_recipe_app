import 'package:flutter/material.dart';

import '../model/recipes_list_model.dart';
import '../ui/recipe_detail_screen.dart';
import '../ui/recipes_list.dart';

class AppRouter {
  static const String homeRoute = '/';
  static const String recipeDetailRoute = '/recipeDetail';

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => RecipesList());
      case recipeDetailRoute:
        final Recipes recipe = settings.arguments as Recipes;
        return MaterialPageRoute(
          builder: (_) => RecipeDetailScreen(recipe: recipe),
        );

      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            );
          },
        );
    }
  }
}
