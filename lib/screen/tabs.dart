import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/meals.dart';
import 'package:meals_app/provider/filter_provider.dart';
import 'package:meals_app/screen/categories.dart';
import 'package:meals_app/screen/filter_screen.dart';
import 'package:meals_app/screen/meals_Screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/widgets/meal_item.dart';
import 'package:meals_app/provider/favorite_provider.dart';



final kinitialFIlters=
{
  Filter.glutenFree:false,
  Filter.lactoseFree:false,
  Filter.vegetarian:false,
  Filter.vegan:false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {


 int _selectedPageIndex=0;

 
 void _selectPage(int index){
  setState(() {
    _selectedPageIndex=index;
  });
 }
 void _setScreen(String identifer) async{
  Navigator.of(context).pop();
if(identifer=='filters'){ 
await Navigator.of(context).push<Map<Filter,bool>>(MaterialPageRoute(
    builder: (cntx)=>  FilterScreen())); 

}

 }
 
  @override
  Widget build(BuildContext context) {
   final activeFilter=ref.watch(filtersProvider);
   final availableMeals=ref.read(filterMealProvider);

    Widget activeScreen=CategoriesScreen(availableMeals: availableMeals,);
    var activePageTitle='Categories';
    if(_selectedPageIndex==1){

        final favoriteMeals=ref.watch(favoriteMealsProvider);
        activeScreen=MealsScreen( meals: favoriteMeals ,);
        activePageTitle='Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(title:Text(activePageTitle) ,),
      drawer:  MainDrawer(onSelectScreen: _setScreen,),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items:const[
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: "Category"),
           BottomNavigationBarItem(icon: Icon(Icons.star),label: "Favorites")
        ],
    ));
  }
}