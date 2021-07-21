import 'package:Meals/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: 200,
        width: double.infinity,
        color: Theme.of(context).accentColor,
        child: Center(
          child: Text(
            "Cooking Up!",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ),
      ),
      SizedBox(
        height: 40,
      ),
      ListTile(
        leading: Icon(
          Icons.fastfood,
          size: 25,
        ),
        title: Text(
          "Meals",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        onTap: () {
          Navigator.of(context).pushNamed('/');
        },
      ),
      ListTile(
        leading: Icon(
          Icons.settings,
          size: 25,
        ),
        title: Text(
          "Filters",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        onTap: () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.route);
        },
      )
    ]));
  }
}
