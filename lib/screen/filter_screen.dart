import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/main.dart';
import 'package:meals_app/provider/filter_provider.dart';
import 'package:meals_app/screen/tabs.dart';
import 'package:meals_app/widgets/main_drawer.dart';



class FilterScreen extends ConsumerWidget {
   FilterScreen({super.key});
  
  Widget build(BuildContext context,WidgetRef ref) {
  final activeFilter=ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
      title: Text('Yours Filter')
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (idenifier){
      //     Navigator.pop(context);
      //     if(idenifier=='meals'){
      //       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (cntx)=>TabsScreen()));
      //     }
      //   } ,),
      // body: PopScope(
      //   canPop: false,
      //  onPopInvoked: (bool didpop){
      //        if(didpop) return;
      //        ref.read(filtersProvider.notifier).setFilters({
      //          Filter.glutenFree:_glutenFreeFilterSet,
      //          Filter.lactoseFree:_lactoseFreeFilterSet,
      //          Filter.vegetarian:_VagetarianFilterSet,
      //          Filter.vegan:_VeganFilterSet
      //         });
           
             
              
      //        Navigator.of(context).pop();
      //  } , 
      //   child: 

      body:Column(
          children: [
            SwitchListTile(
              value: activeFilter[Filter.glutenFree]!,
               onChanged: (isChecked){
                ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.glutenFree, isChecked);
                 
               },
               title: Text('GLuten-free',
               style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface
               ),),
               subtitle: Text('Only include gluten-free meals',
               style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface
               ),),
               activeColor: Theme.of(context).colorScheme.tertiary,
               contentPadding: EdgeInsets.only(left: 34,right: 22),
               
               ),
               SwitchListTile(
              value: activeFilter[Filter.lactoseFree]!,
               onChanged: (isChecked){
                ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.lactoseFree, isChecked);
               },
               title: Text('Lactose-free',
               style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface
               ),),
               subtitle: Text('Only include lactose-free meals',
               style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface
               ),),
               activeColor: Theme.of(context).colorScheme.tertiary,
               contentPadding: EdgeInsets.only(left: 34,right: 22),
               
               ),
                 SwitchListTile(
              value:activeFilter[Filter.vegetarian]!,
               onChanged: (isChecked){
                ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegetarian, isChecked);
               },
               title: Text('Vegitarian',
               style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface
               ),),
               subtitle: Text('Only include vagetarian meals',
               style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface
               ),),
               activeColor: Theme.of(context).colorScheme.tertiary,
               contentPadding: EdgeInsets.only(left: 34,right: 22),
               
               ),
                 SwitchListTile(
              value: activeFilter[Filter.vegan]!,
               onChanged: (isChecked){
                ref
                .watch(filtersProvider.notifier)
                .setFilter(Filter.vegan, isChecked);
               },
               title: Text('Vegan-free',
               style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface
               ),),
               subtitle: Text('Only include vegan-free meals',
               style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface
               ),),
               activeColor: Theme.of(context).colorScheme.tertiary,
               contentPadding: EdgeInsets.only(left: 34,right: 22),
               
               )
          ],
        ),
      );
    
  }
}