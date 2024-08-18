import 'package:flutter/material.dart';
import 'package:meals_app/model/meals.dart';
import 'package:meals_app/screen/meals_details.dart';
import 'package:meals_app/widgets/meal_item.dart';


class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key,
                       this.title,
                      required this.meals,
                    
                      });
  final String? title;
  final List<Meal> meals;
  void selecteMeal(BuildContext context,Meal meal){
    Navigator.of(context).push(MaterialPageRoute(builder: (cntx)=>MealsDetailsScreen(
      meal: meal)));
  }
  @override
  Widget build(BuildContext context) {
    Widget  content= Center(
      child:   Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Text("Uh oh ... nothing here!",
           style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface)),
          Text("Try selecting different category!",   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface))
        ],
      ),
    );
     if(meals.isNotEmpty){
      content=ListView.builder(itemCount: meals.length,itemBuilder: (context,index){
        return MealItem(meal: meals[index],onSelectedMeal:(meal){
          selecteMeal(context, meal);
        });
      });
     }
     if (title==null){
       return  content ; }
    return Scaffold(
      appBar:AppBar(
        title: Text(title!),
      ) ,
      body: content
    );
  }
}