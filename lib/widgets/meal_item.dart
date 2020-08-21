import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  MealItem(this.title);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(title),
    );
  }
}
