import 'package:flutter/material.dart';
import 'meals_specification.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/categories-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = MealSpecification.where((element) {
      
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (context, index){

      },itemCount: ,),
    );
  }
}
