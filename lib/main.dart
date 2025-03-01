import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/bloc/recipes_list_bloc/recipes_list_event.dart';
import 'package:recipes/router/app_router.dart';
import 'package:recipes/ui/recipes_list.dart';

import 'bloc/recipes_list_bloc/recipes_list_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipesListBloc()..add(RecipesListEvent()),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Roboto'
        ),
        initialRoute: AppRouter.homeRoute,
        onGenerateRoute: AppRouter.generateRoute,
        home: RecipesList(),
      ),
    );
  }
}

