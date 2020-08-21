import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String url;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  // layout variables
  final radius = 15.0;
  String get complexityText {
    switch (complexity) {
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Simple:
        return 'Simple';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Expensive';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  MealItem({
    @required this.title,
    @required this.url,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.zero,
                top: Radius.circular(radius),
              ),
              child: Stack(
                children: [
                  Image.network(
                    url,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    child: Container(
                      width: 300,
                      color: Colors.black45,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      //alignment: Alignment.bottomRight,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    bottom: 20,
                    right: 10,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.schedule,
                    ),
                    Text('$duration min')
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.work,
                    ),
                    Text(complexityText)
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                    ),
                    Text(affordabilityText)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
