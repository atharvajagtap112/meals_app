import 'package:flutter/material.dart';
import 'package:meals_app/model/meals.dart';
import 'package:meals_app/screen/meals_details.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
   MealItem({super.key,
   required this.meal,
   required this.onSelectedMeal
   });
  final Meal meal;
  String get complexityText{
    return meal.complexity.name[0].toUpperCase()+meal.complexity.name.substring(1);
  }
  String get affordabilityText{
    return meal.affordability.name[0].toUpperCase()+meal.affordability.name.substring(1);
  }
   final void Function(Meal meal) onSelectedMeal;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.all(8),
      clipBehavior:Clip.hardEdge ,
      elevation: 2,
      child: InkWell(
        onTap: () {
        onSelectedMeal(meal);
       
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                 image: NetworkImage(meal.imageUrl),
                 fit:BoxFit.cover,
                 height: 200,
                 width: double.infinity,
                 ),
            ),
               Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 6,horizontal: 44),
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Text(meal.title,
                       maxLines: 2,
                       textAlign: TextAlign.center,
                       overflow: TextOverflow.ellipsis,
                        softWrap: true,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20

                          ),
                       ),
                      const SizedBox(
                        height: 12,),
                        Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MealItemTrait(icon: Icons.schedule, lable:'${meal.duration} min' ),
                            const SizedBox(width: 12,),
                            MealItemTrait(icon: Icons.work, lable:complexityText) ,
                             const SizedBox(width: 12,),
                              MealItemTrait(icon: Icons.attach_money, lable:complexityText) ,

                          ],
                        )
                    ],
                  ),
                ))
          ],)),
    );
  }
}