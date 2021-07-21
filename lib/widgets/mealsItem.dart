import 'package:Meals/models/meal.dart';
import 'package:Meals/screens/mealDetails_screen.dart';
import 'package:flutter/material.dart';

class MealsItem extends StatelessWidget {
  Meal meal;
  Function deleteMeal;
  MealsItem(this.meal, this.deleteMeal);

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailsScreen.route,
        arguments: {'meal': meal}).then((value) {
      if (value != null) {
        deleteMeal(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black54,
                      ),
                      width: 250,
                      child: Text(
                        meal.title,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                        //overflow: TextOverflow.fade,
                        softWrap: true,
                      ),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${meal.duration}')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                          '${meal.complexity.toString().substring(11, meal.complexity.toString().length)}')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                          '${meal.affordability.toString().substring(14, meal.affordability.toString().length)}')
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
