import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'Categories_Screen.dart';
import 'favorites_Screen.dart';
import '../widgets/Custom_drawer.dart';

class BottomNavigationPage extends StatefulWidget {
  final List<Meal> favouriteMeals;
  BottomNavigationPage(this.favouriteMeals);

  static const routeName = './Bottom_Navigation';

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  late List<Map<String, dynamic>> _pages;
  int _selectedpageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': const CategoryScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoriteScreen(widget.favouriteMeals),
        'title': 'Your Favorite',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedpageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedpageIndex]['title']),
      ),
      drawer: const DrawerWidget(),
      body: _pages[_selectedpageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedpageIndex,
        backgroundColor: Colors.pink,
        onTap: _selectPage,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        items: const [
          BottomNavigationBarItem(
            label: 'Categories',
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}
