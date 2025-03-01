import '../../model/recipes_list_model.dart';

abstract class RecipesListState {}

class RecipesListInitialState extends RecipesListState {}

class RecipesListLoadingState extends RecipesListState {}

class RecipesListLoadedState extends RecipesListState {
  List<Recipes>? recipes;

  RecipesListLoadedState({required this.recipes});
}

class RecipesListErrorState extends RecipesListState {
  String error;
  RecipesListErrorState({required this.error});
}
