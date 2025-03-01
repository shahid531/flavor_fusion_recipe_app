import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/bloc/recipes_list_bloc/recipes_list_bloc.dart';
import 'package:recipes/bloc/recipes_list_bloc/recipes_list_state.dart';
import 'package:recipes/router/app_router.dart';

class RecipesList extends StatefulWidget {
  const RecipesList({super.key});

  @override
  State<RecipesList> createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: BlocConsumer<RecipesListBloc, RecipesListState>(
          builder: (context, state) {
            if (state is RecipesListLoadedState) {
              return GridView.builder(
                itemCount: state.recipes?.length ?? 0,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                itemBuilder: (context, index) {
                  String foodImage = '${state.recipes?[index].image}';
                  String foodTitle = '${state.recipes?[index].name}';
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRouter.recipeDetailRoute,
                        arguments: state.recipes?[index],
                      );
                    },
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shadowColor: Colors.orange,
                      elevation: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 2,
                            child: CachedNetworkImage(
                              imageUrl: foodImage,
                              placeholder:
                                  (context, url) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                              errorWidget:
                                  (context, url, error) => Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                foodTitle,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
              );
            } else if (state is RecipesListLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            return SizedBox.shrink();
          },
          listener: (context, state) {
            if (state is RecipesListErrorState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
        ),
      ),
    );
  }
}
