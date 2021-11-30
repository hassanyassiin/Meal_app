import 'package:flutter/material.dart';

import 'screens/categories_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/meal_detailed_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
                fontSize: 18,
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              subtitle1: const TextStyle(
                fontSize: 38,
                fontFamily: 'GreatVibes',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //  home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(),
        Menu.routeName: (ctx) => Menu(),
        MealDetailedScreen.routeName: (ctx) => MealDetailedScreen(),
        Filters.routeName: (ctx) => Filters(),
        // TabsScreen.routeName: (ctx) => TabsScreen(),
      },
      // onGenerateRoute: (settings){
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx)=> CategoryScreen());
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
