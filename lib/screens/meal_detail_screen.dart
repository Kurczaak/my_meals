import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(String title, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    Meal selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    return Scaffold(
        appBar: AppBar(title: Text(selectedMeal.title)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle('Ingredients', context),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 200,
                width: 300,
                child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return Card(
                        elevation: 3,
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            selectedMeal.ingredients[index],
                          ),
                        ),
                      );
                    },
                    itemCount: selectedMeal.ingredients.length),
              ),
              buildSectionTitle('Steps', context),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 200,
                width: 300,
                child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                (index + 1).toString(),
                              ),
                            ),
                            title: Text(
                              selectedMeal.steps[index],
                            ),
                          ),
                          Divider(
                            thickness: 2,
                          ),
                        ],
                      );
                    },
                    itemCount: selectedMeal.steps.length),
              ),
              Padding(padding: EdgeInsets.all(10))
            ],
          ),
        ));
  }
}
