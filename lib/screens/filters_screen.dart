import 'package:Meals/widgets/drawerWidget.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const route = '/filters';
  Function save;
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  FiltersScreen(this.filters, this.save);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  static bool glutenFree = false;
  static bool lactoseFree = false;
  static bool vegan = false;
  static bool vegetarian = false;

  @override
  void initState() {
    glutenFree = widget.filters['gluten'];
    lactoseFree = widget.filters['lactose'];
    vegan = widget.filters['vegan'];
    vegetarian = widget.filters['vegetarian'];
    super.initState();
  }

  Widget buildSwitches(
      bool value, String description, String title, Function fun) {
    return SwitchListTile(
      onChanged: fun,
      value: value,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Map<String, bool> ffilters = {
            'gluten': glutenFree,
            'lactose': lactoseFree,
            'vegan': vegan,
            'vegetarian': vegetarian,
          };
          widget.save(ffilters);
        },
        child: Icon(Icons.save),
      ),
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              buildSwitches(
                glutenFree,
                "Only include gulten-free meals",
                "GlutenFree",
                (newVal) {
                  setState(() {
                    glutenFree = newVal;
                  });
                },
              ),
              buildSwitches(
                lactoseFree,
                "Only include lactose-free meals",
                "LactoseFree",
                (newVal) {
                  setState(() {
                    lactoseFree = newVal;
                  });
                },
              ),
              buildSwitches(
                vegan,
                "Only include vegan-free meals",
                "Vegan",
                (newVal) {
                  setState(() {
                    vegan = newVal;
                  });
                },
              ),
              buildSwitches(
                vegetarian,
                "Only include vegetarian-free meals",
                "vegetarian",
                (newVal) {
                  setState(() {
                    vegetarian = newVal;
                  });
                },
              )
            ],
          ))
        ],
      ),
    );
  }
}
