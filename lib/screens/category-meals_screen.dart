import 'package:Meals_category/models/meals.dart';

import '../widgets/meals-item.dart';
import 'package:flutter/material.dart';
import '../meals_specification_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categories-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;


  @override
  void didChangeDependencies() {

    if (!_loadedInitData){
        final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    displayedMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    _loadedInitData = true;
    }
  
    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealsItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            removeItem: _removeItem,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
