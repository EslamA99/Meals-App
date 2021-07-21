import 'package:Meals/dummy_data.dart';

import 'package:flutter/material.dart';

import 'models/meal.dart';
import 'screens/categoriesMeals_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/mealDetails_screen.dart';
import 'screens/tabs_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> favMeals = [];

  var mealsList = DUMMY_MEALS;

  void save(Map<String, bool> newFilters) {
    setState(() {
      filters = newFilters;
      mealsList = DUMMY_MEALS.where((element) {
        if (!element.isGlutenFree && filters['gluten']) return false;
        if (!element.isLactoseFree && filters['lactose']) return false;
        if (!element.isVegan && filters['vegan']) return false;
        if (!element.isVegetarian && filters['vegetarian']) return false;
        return true;
      }).toList();
    });
  }

  void saveFavMeals(Meal meal) {
    if (favMeals.contains(meal)) {
      setState(() {
        favMeals.remove(meal);
      });
    } else {
      setState(() {
        favMeals.add(meal);
      });
    }
  }

  bool isFav(Meal meal) {
    return favMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(primarySwatch: Colors.pink, accentColor: Colors.amber),
      routes: {
        '/': (context) => TabsScreen(favMeals),
        CategoriesMealsScreen.route: (context) =>
            CategoriesMealsScreen(mealsList),
        MealDetailsScreen.route: (context) =>
            MealDetailsScreen(isFav, saveFavMeals),
        FiltersScreen.route: (context) => FiltersScreen(filters, save),
      },
    );
  }
}
