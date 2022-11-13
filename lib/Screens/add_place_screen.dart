import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:greatplaceapp/provider/great_place.dart';
import 'package:greatplaceapp/widgets/image_input.dart';
import 'dart:io';
import 'package:greatplaceapp/provider/great_place.dart';
import '../provider/great_place.dart';


import 'package:provider/provider.dart';
class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;
  void _selectImage(File  pickImage){
_pickedImage=pickImage;

  }
  void _savePlace(){
    if (_titleController.text.isEmpty||_pickedImage==null ) return;
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage!);
    Navigator.of(context).pop();



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Place"),
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: _titleController,
                ),
                SizedBox(
                  height: 10,
                ),
                ImageInput(_selectImage),
              ],
            ),
          ))),
          ElevatedButton.icon(
              onPressed: _savePlace, icon: Icon(Icons.add), label: Text("Add place"))
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }
}
