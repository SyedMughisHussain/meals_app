import 'package:flutter/material.dart';
import 'package:meals_app/widgets/Category_item.dart';
import 'package:meals_app/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static const routeName = './Category_Screen';

  @override
  Widget build(BuildContext context) {
    return GridView(
      // ignore: prefer_const_constructors
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 130.0,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 20.0,
        crossAxisCount: 2,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(catData.id, catData.title, catData.color),
          )
          .toList(),
    );
  }
}
