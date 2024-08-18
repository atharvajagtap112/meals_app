import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/model/meals.dart';
import 'package:meals_app/provider/favorite_provider.dart';
import 'package:meals_app/provider/filter_provider.dart';

class MealsDetailsScreen extends ConsumerWidget {
  const MealsDetailsScreen({super.key
  ,required this.meal,
   
  
  });
   final Meal meal;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final favoriteMeals=ref.watch(favoriteMealsProvider);
    final isFavorite=favoriteMeals.contains(meal);
    return  Scaffold(
          appBar: AppBar(
            title: Text(meal.title),
            actions: [
              IconButton(
                onPressed:(){
                 final wasAdded= ref.watch(favoriteMealsProvider.notifier).toggelMealFavoriteStatus(meal);
                   ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                      content: Text(wasAdded? "Meals added as a favorite.":'Meal removed.')));
 },
              
                  
                icon:AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return RotationTransition(
                      turns: Tween<double>(begin: 0.7,
                      end: 1).animate(animation),
                      child: child,
                      );}, 
                  child: Icon(isFavorite?Icons.star:Icons.star_border,key:ValueKey(isFavorite))))
            ],
          ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(meal.imageUrl,
              fit:BoxFit.cover
              ),
            ),
            const SizedBox(
              height: 14,
            ),
           Text('Ingredients',
           style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary
           ),),
           for(final ingredients in meal.ingredients)
               Text(ingredients,
               style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSurface
           )),
            const SizedBox(
              height: 14,
            ),
           Text('Steps',
           style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary
           ),),
           const SizedBox(
              height: 14),
           for(final step in meal.steps)
              
               Padding(
                 padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8
                 ),
                 child: Text(step,
                 textAlign: TextAlign.center,
                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                           color: Theme.of(context).colorScheme.onSurface
                          )),
               )
          ],
        ),
      )
    );
  }
}