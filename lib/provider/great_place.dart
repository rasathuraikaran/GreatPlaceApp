import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _item = [];
  List<Place> get items {
    return [..._item];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: pickedTitle,
        location: PlaceLocation(
          adress: "karan",
          latitude: 1111,
          longitude: 1111,
        ),
        image: pickedImage);

    _item.add(newPlace);
    notifyListeners();
  }
}
