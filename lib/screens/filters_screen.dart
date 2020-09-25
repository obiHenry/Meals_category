import 'package:Meals_category/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;

  FiltersScreen(this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarianFree = false;
  bool _veganFree = false;
  bool _lactosefree = false;

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('your filters'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: widget.saveFilters,
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust your meal selection.'),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-free',
                  'only include gluten-free meals.',
                  _glutenFree,
                  (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'vegeterian-free',
                  'only include vegeterian-free meals.',
                  _vegetarianFree,
                  (newValue) {
                    setState(
                      () {
                        _vegetarianFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'only include lactose-free meals.',
                  _lactosefree,
                  (newValue) {
                    setState(
                      () {
                        _lactosefree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegan-free',
                  'only include Vegan-free meals.',
                  _veganFree,
                  (newValue) {
                    setState(
                      () {
                        _veganFree = newValue;
                      },
                    );
                  },
                ),
              ],
            ))
          ],
        ));
  }
}
