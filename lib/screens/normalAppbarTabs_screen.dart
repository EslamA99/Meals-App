import 'package:Meals/models/meal.dart';
import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favorites_screen.dart';

class NormalAppbarTabsScreen extends StatelessWidget {
  static const route = '/normalAppbar';
  List<Meal> favMeals = [];
  NormalAppbarTabsScreen(this.favMeals);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("DeliMeals"),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.category),
              text: "Category",
            ),
            Tab(
              icon: Icon(Icons.favorite),
              text: "Favorites",
            ),
          ]),
        ),
        body: TabBarView(
            children: [Category_screen(), FavoritesScreen(favMeals)]),
      ),
    );
  }
}
