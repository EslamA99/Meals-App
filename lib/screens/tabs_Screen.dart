import 'package:Meals/models/meal.dart';
import 'package:Meals/widgets/drawerWidget.dart';
import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favMeals = [];
  TabsScreen(this.favMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages;
  int pageIndex = 0;

  @override
  void initState() {
    pages = [
      {'page': Category_screen(), 'name': 'Categories'},
      {'page': FavoritesScreen(widget.favMeals), 'name': 'Your favorites'}
    ];
    super.initState();
  }

  void select(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[pageIndex]['name']),
      ),
      drawer: DrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          currentIndex: pageIndex,
          onTap: select,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text("Category")),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), title: Text("Favorites")),
          ]),
      body: pages[pageIndex]['page'],
    );
  }
}
