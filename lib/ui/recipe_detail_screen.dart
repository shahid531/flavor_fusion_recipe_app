import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import '../model/recipes_list_model.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipes recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  @override
  void initState() {
    print('DATA:- ${widget.recipe.image}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          width: width,
          height: height,
          child: Card(
            shadowColor: Colors.orange,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: '${widget.recipe.image}',
                  placeholder:
                      (context, url) =>
                          Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: width,
                  child: Text(
                    '${widget.recipe.name}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ingredients:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: widget.recipe.ingredients?.length ?? 0,
                            itemBuilder: (context, index) {
                              final ingredients =
                                  widget.recipe.ingredients?[index];
                              return Card(
                                shadowColor: Colors.orange,
                                elevation: 5,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: Row(
                                    children: [
                                      Icon(Icons.arrow_right),
                                      Expanded(
                                        child: Text(
                                          '$ingredients',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Instructions:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: widget.recipe.instructions?.length ?? 0,
                            itemBuilder: (context, index) {
                              final instructions =
                              widget.recipe.instructions?[index];
                              return Card(
                                shadowColor: Colors.orange,
                                elevation: 5,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: Row(
                                    children: [
                                      Icon(Icons.arrow_right),
                                      Expanded(
                                        child: Text(
                                          '$instructions',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Other Details:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(child: Card(
                                elevation: 10,
                                shadowColor: Colors.orange,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('PrepTime: ${widget.recipe.prepTimeMinutes} min',textAlign: TextAlign.center,maxLines: 1,),
                                ),
                              )),
                              Expanded(child: Card(
                                elevation: 10,
                                shadowColor: Colors.orange,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('CookTime: ${widget.recipe.cookTimeMinutes} min',textAlign: TextAlign.center,maxLines: 1,),
                                ),
                              )),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(child: Card(
                                elevation: 10,
                                shadowColor: Colors.orange,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Difficulty: ${widget.recipe.difficulty}',textAlign: TextAlign.center,maxLines: 1,),
                                ),
                              )),
                              Expanded(child: Card(
                                elevation: 10,
                                shadowColor: Colors.orange,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Cuisine: ${widget.recipe.cuisine}',textAlign: TextAlign.center,maxLines: 1,),
                                ),
                              )),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(child: Card(
                                elevation: 10,
                                shadowColor: Colors.orange,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Calories: ${widget.recipe.caloriesPerServing}',textAlign: TextAlign.center,maxLines: 1,),
                                ),
                              )),
                              Expanded(child: Card(
                                elevation: 10,
                                shadowColor: Colors.orange,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Servings: ${widget.recipe.servings}',textAlign: TextAlign.center,maxLines: 1,),
                                ),
                              )),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Meal Type:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: widget.recipe.mealType?.length ?? 0,
                            itemBuilder: (context, index) {
                              final mealType =
                              widget.recipe.ingredients?[index];
                              return Card(
                                shadowColor: Colors.orange,
                                elevation: 5,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: Row(
                                    children: [
                                      Icon(Icons.arrow_right),
                                      Expanded(
                                        child: Text(
                                          '$mealType',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 10),
                          Container(
                            alignment: Alignment.centerRight,
                            child: RatingStars(
                              value: widget.recipe.rating ?? 0.0,
                              valueLabelVisibility: false,
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
