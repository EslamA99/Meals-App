import 'package:Meals/dummy_data.dart';
import 'package:Meals/widgets/categoryItem.dart';
import 'package:flutter/material.dart';

class Category_screen extends StatelessWidget {
  static const route = '/categories';
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 2),
        children: DUMMY_CATEGORIES
            .map((e) => CategoryItem(e.title, e.color, e.id))
            .toList());
  }
}
