import 'package:Meals/models/meal.dart';
import 'package:Meals/widgets/mealsItem.dart';
import 'package:flutter/material.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const route = '/categoriesMeals';
  List<Meal> allowedMeals;
  CategoriesMealsScreen(this.allowedMeals);
  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  List<Meal> mealsList = [];
  String categoryName;
  bool loadlInitialData = false;

  @override
  void initState() {
    //مينفعش عشان بترن قبل ما الكونتكست يكون اتعمل
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!loadlInitialData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryName = routeArgs['title'];
      mealsList = widget.allowedMeals
          .where((element) => element.categories.contains(routeArgs['id']))
          .toList();
      loadlInitialData = true;
    }
    super.didChangeDependencies();
  }

  deleteMeal(String value) {
    setState(() {
      mealsList.removeWhere((element) => element.id == value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryName),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealsItem(mealsList[index], deleteMeal);
          },
          itemCount: mealsList.length,
        ));
  }
}
