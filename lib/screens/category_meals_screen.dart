import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CatergoryMealsScreen extends StatefulWidget {
  static String routeName = '/category-meals';

  final List<Meal> availableMeals;

  const CatergoryMealsScreen(this.availableMeals);

  @override
  State<CatergoryMealsScreen> createState() => _CatergoryMealsScreenState();
}

class _CatergoryMealsScreenState extends State<CatergoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var meal = displayedMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
