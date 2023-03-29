import 'package:flutter/material.dart';
import '../widgets/Custom_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  static const routeName = './filters_Screen';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegeterian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegeterian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10),
            alignment: Alignment.center,
            child: const Text(
              'Adjust Your Meal Section',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SwitchListTile(
            title: const Text(
              'Gluten-Free',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              'Only Included gluten-free meals.',
            ),
            value: _glutenFree,
            onChanged: (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            },
          ),
          SwitchListTile(
            title: const Text(
              'Lactose-Free',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              'Only Included Lactose-free meals.',
            ),
            value: _lactoseFree,
            onChanged: (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            },
          ),
          SwitchListTile(
            title: const Text(
              'Vegetarian',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              'Only Included Vegatarian meals.',
            ),
            value: _vegeterian,
            onChanged: (newValue) {
              setState(() {
                _vegeterian = newValue;
              });
            },
          ),
          SwitchListTile(
            title: const Text(
              'Vegan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              'Only Included Vegan meals.',
            ),
            value: _vegan,
            onChanged: (newValue) {
              setState(() {
                _vegan = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
