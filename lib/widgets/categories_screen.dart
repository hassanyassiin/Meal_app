
import 'package:flutter/material.dart';


import '../models/dummy_data_m.dart';
import 'category_item.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('DeliMeal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1.32,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: DUMMY_CATEGORIES.map((catD) {
            return CategoryItem(title: catD.title, color: catD.color,id: catD.id,);
          }).toList(),
        ),
      ),
    );
  }
}
