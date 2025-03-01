import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/bloc/recipes_list_bloc/recipes_list_event.dart';
import 'package:recipes/bloc/recipes_list_bloc/recipes_list_state.dart';
import 'package:recipes/model/recipes_list_model.dart';

class RecipesListBloc extends Bloc<RecipesListEvent, RecipesListState> {
  RecipesListBloc() : super(RecipesListInitialState()) {
    on<RecipesListEvent>((event, emit) async {
      await recipesListApi(event, emit);
    });
  }

  Future<void> recipesListApi(
    RecipesListEvent event,
    Emitter<RecipesListState> emit,
  ) async {
    final dio = Dio();
    try {
      emit(RecipesListLoadingState());
      final response = await dio.get('https://dummyjson.com/recipes');
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> li = response.data['recipes'];
        List<Recipes>? recipes = li.map((e) => Recipes.fromJson(e),).toList();
        emit(RecipesListLoadedState(recipes: recipes));
      } else {
        emit(RecipesListErrorState(error: response.statusCode.toString()));
      }
    } on DioException catch (e) {
      emit(RecipesListErrorState(error: e.response!.statusCode.toString()));
    }
  }
}
