import 'package:flutter/material.dart';
import 'package:greatplaceapp/Screens/add_place_screen.dart';
import 'package:greatplaceapp/provider/great_place.dart';
import 'package:provider/provider.dart';

import 'Screens/places_list_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(value: GreatPlaces(),
    child: MaterialApp(
      title: 'Great Places',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.amber,
      ),
      home: PlacesListScreen(),
      routes: {
        AddPlaceScreen.routeName:(ctx)=>AddPlaceScreen(),
      },
    ));
  }
}
