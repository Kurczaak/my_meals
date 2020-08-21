import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catTitle = routeArgs['title'];
    final id = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(catTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            Meal currMeal = categoryMeals[index];
            return MealItem(
              id: currMeal.id,
              title: currMeal.title,
              affordability: currMeal.affordability,
              complexity: currMeal.complexity,
              duration: currMeal.duration,
              url: currMeal.imageUrl,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
