import 'package:flutter/material.dart';

import '../widgets/darwer_widget.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _glutenFree = false;
  bool _vegeterianFree = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget switchBuilder(
      String title, String subTitle, bool argument, dynamic update) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: argument,
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        drawer: DrawerWidget(),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your Meal selection',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  switchBuilder('Gluten-free', 'only include gluten-free meal',
                      _glutenFree, (neValue) {
                    setState(() {
                      _glutenFree = !_glutenFree;
                    });
                  }),
                  switchBuilder(
                      'lactose-free',
                      'only include lactose-free meal',
                      _lactoseFree, (newValue) {
                    setState(() {
                      _lactoseFree = !_lactoseFree;
                    });
                  }),
                  switchBuilder(
                      'vegeterian-free',
                      'only include vegeterian-free meal',
                      _vegeterianFree, (newValue) {
                    setState(() {
                      _vegeterianFree = !_vegeterianFree;
                    });
                  }),
                  switchBuilder(
                      'vegan-free', 'only include vegan-free meal', _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = !_vegan;
                    });
                  }),
                ],
              ),
            ),
          ],
        ));
  }
}
