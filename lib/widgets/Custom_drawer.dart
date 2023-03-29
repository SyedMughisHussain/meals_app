import 'package:flutter/material.dart';
import '../screens/Filters_Screen.dart';
import '../screens/tab_bar_Screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 140,
            width: double.infinity,
            color: Colors.amber,
            child: const Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(BottomNavigationPage.routeName);
            },
            leading: Icon(Icons.restaurant),
            title: const Text(
              'Meals',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            },
            leading: const Icon(Icons.settings),
            title: const Text(
              'Filters',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
