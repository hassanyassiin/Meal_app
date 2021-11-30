import 'package:flutter/material.dart';

import '../screens/meal_detailed_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String image;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability afford;
  final Function removeItem;

  MealItem({
    required this.id,
    required this.image,
    required this.title,
    required this.duration,
    required this.complexity,
    required this.afford,
    required this.removeItem,
  });

  void selectedMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(
      MealDetailedScreen.routeName,
      arguments: id,
    )
        .then((value) {
          if(value!=null)
            {
              removeItem(value);
            }

    });
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'unKnown';
    }
  }

  String get affordableText {
    switch (afford) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'unKnown';
    }
  }
  // String  affordableTexte() {
  //   switch (afford) {
  //     case Affordability.Affordable:
  //       return 'Affordable';
  //       break;
  //     case Affordability.Luxurious:
  //       return 'Luxurious';
  //       break;
  //     case Affordability.Pricey:
  //       return 'Pricey';
  //       break;
  //     default:
  //       return 'unKnown';
  //   }
  // }??????????????????????????????????????????????????????????????????????? why

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => selectedMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    image,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: 300,
                      color: Colors.black54,
                      child: Text(
                        title,
                        style:
                            const TextStyle(fontSize: 26, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(Icons.schedule),
                      const SizedBox(width: 5),
                      Text('$duration min '),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.work),
                      const SizedBox(width: 5),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 5),
                      Text(affordableText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
