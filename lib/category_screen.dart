import './meals_specification.dart';
import 'package:Meals_category/category-item.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('African Meals'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        children: MealSpecification.map(
          (categoryData) => CategoryItem(
            categoryData.title,
            categoryData.color,
            categoryData.id,
          ),
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
