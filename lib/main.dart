import 'package:flutter/material.dart';

import './widgets/categories_screen.dart';
import './widgets/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Pacifico',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              subtitle1: const TextStyle(
                fontSize: 34,
                fontFamily: 'GreatVibes',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
    //  home: CategoriesScreen(),
      routes: {
        '/': (ctx)=> CategoriesScreen(),
        Menu.routeName: (ctx) => Menu(),
      },
    );
  }
}
