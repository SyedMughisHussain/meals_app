import 'package:flutter/material.dart';
import 'package:meals_app/screens/Category_Meals_Screen.dart';
import 'package:meals_app/screens/Meal_Detail_Screen.dart';
import 'package:meals_app/dummy_data.dart';
import 'models/meal.dart';
import 'screens/tab_bar_Screen.dart';
import 'screens/Categories_Screen.dart';
import 'screens/Filters_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  final List<Meal> _favouriteMeals = [];
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS
          .where((meal) {
            if (_filters['gluten']! && !meal.isGlutenFree) {
              return false;
            }
            if (_filters['lactose']! && !meal.isLactoseFree) {
              return false;
            }
            if (_filters['vegan']! && !meal.isVegan) {
              return false;
            }
            if (_filters['vegetarian']! && !meal.isVegetarian) {
              return false;
            }
            return true;
          })
          .cast<Meal>()
          .toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex > 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isFavourite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Roboto',
      ),
      home: BottomNavigationPage(_favouriteMeals),
      routes: {
        BottomNavigationPage.routeName: (context) =>
            BottomNavigationPage(_favouriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavourite, _isFavourite),
        CategoryScreen.routeName: (context) => const CategoryScreen(),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters)
      },
    );
  }
}
