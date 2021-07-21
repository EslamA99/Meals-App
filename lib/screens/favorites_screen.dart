import 'package:Meals/models/meal.dart';
import 'package:Meals/widgets/mealsItem.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  static const route = '/favorites';
  List<Meal> favMeals = [];
  FavoritesScreen(this.favMeals);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  deleteMeal(String value) {
    setState(() {
      widget.favMeals.removeWhere((element) => element.id == value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return MealsItem(widget.favMeals[index], deleteMeal);
      },
      itemCount: widget.favMeals.length,
    );
  }
}
