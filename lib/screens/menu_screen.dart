import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';

import '../models/dummy_data_m.dart';

class Menu extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;
  //
  // CategoryMealsScreen({required this.categoryId,required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final routeId = routeArgs['id'];
    final routeTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(routeId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(routeTitle.toString(),style: Theme.of(context).textTheme.subtitle1,),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            image: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            afford: categoryMeals[index].affordable,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
