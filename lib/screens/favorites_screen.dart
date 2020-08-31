import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> meals;
  FavoritesScreen(this.meals);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.meals.isEmpty
          ? Center(
              child: Text('No favorite meals added'),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                Meal currMeal = widget.meals[index];
                return MealItem(
                  id: currMeal.id,
                  title: currMeal.title,
                  affordability: currMeal.affordability,
                  complexity: currMeal.complexity,
                  duration: currMeal.duration,
                  url: currMeal.imageUrl,
                );
              },
              itemCount: widget.meals.length,
            ),
    );
  }
}
