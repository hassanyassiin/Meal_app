import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';


class DrawerWidget extends StatelessWidget {
  Widget listTileBuilder(String title, IconData icon, dynamic tapHandeler) {
    return ListTile(
      onTap:  tapHandeler,
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking up',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          listTileBuilder('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed(
              '/',
            );
          }),
          listTileBuilder('Settings', Icons.settings,() {
            Navigator.of(context).pushReplacementNamed(
              Filters.routeName,
            );
          }),
        ],
      ),
    );
  }
}
