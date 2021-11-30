import 'package:flutter/material.dart';

import 'favorite_screen.dart';
import 'categories_screen.dart';
import '../widgets/darwer_widget.dart';

class TabsScreen extends StatefulWidget {
  // static const routeName ='/tabs';
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages=[
    {'page': CategoriesScreen(), 'title':'Categories'},
    {'page': FavoriteScreen(), 'title':'Favorite'},
  ];

  int _selectedPageIndex=0;

  void _selectPage(int index)
  {
    setState(() {
      _selectedPageIndex=index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  SafeArea(
        child: DrawerWidget(),
      ),
      appBar: AppBar(
        title:  Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,

        items:   [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),title: const Text("Categories")
          ),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.star),title: const Text("Favorites")

          ),],
      ),
    );
  }
}

// here if we want the bar to be in the top of our app
// import 'package:flutter/material.dart';
// import 'favorite_screen.dart';
// import 'categories_screen.dart';
//
// class TabsScreen extends StatefulWidget {
//
//
//   @override
//   State<TabsScreen> createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return  DefaultTabController(
//       initialIndex: 0,
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//             title: const Text('Categories'),
//             bottom: const TabBar(tabs: <Widget>[
//               Tab(icon: Icon(Icons.category),text: 'Categories',),
//               Tab(icon: Icon(Icons.star),text: 'Favorites'),
//             ])
//         ),
//         body: TabBarView(
//           children: <Widget>[
//             CategoriesScreen(),
//             FavoriteScreen(),
//
//           ],
//         ),
//
//
//       ),
//     );
//   }
// }
