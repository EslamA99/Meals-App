import 'package:Meals/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatefulWidget {
  static const String route = '/mealDeatails';
  Function isFav;
  Function saveFav;
  MealDetailsScreen(this.isFav, this.saveFav);

  @override
  _MealDetailsScreenState createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  Widget centerWords(String str) {
    return Center(
      child: Text(
        str,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Meal>;
    Meal meal = routeArgs['meal'];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: () {
            Navigator.of(context).pop(meal.id);
          }),
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              icon: widget.isFav(meal)
                  ? Icon(Icons.star)
                  : Icon(Icons.star_border),
              onPressed: widget.isFav(meal)
                  ? () {
                      Navigator.of(context).pop(meal.id);
                    }
                  : () => widget.saveFav(meal))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 15,
            ),
            centerWords("Ingredients"),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 180,
              width: 280,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      width: 1, color: Colors.grey, style: BorderStyle.solid)),
              child: ListView(
                padding: EdgeInsets.all(5),
                children: meal.ingredients.map((e) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).accentColor),
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    child: Text(e),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            centerWords("Steps"),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 220,
              width: 280,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      width: 1, color: Colors.grey, style: BorderStyle.solid)),
              child: ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Card(
                        margin: EdgeInsets.all(5),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Text('# $index'),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
