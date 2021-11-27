import 'package:flutter/material.dart';

import '../widgets/menu.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({required this.title, required this.color, required this.id});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed( Menu.routeName, arguments: {'id': id, 'title': title});
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            color.withOpacity(0.6),
            color,
          ], begin: Alignment.bottomRight, end: Alignment.topLeft),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
