import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storeImage = null;
  final ImagePicker _picker = ImagePicker();
  Future<void> _takePicture() async {
    var imageFile =
        await _picker.pickImage(source: ImageSource.camera, maxWidth: 600);
    if (imageFile == null) return;
    setState(() {
      _storeImage = File(imageFile.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage =
        await File(imageFile.path).copy('${appDir.path}/$fileName');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _storeImage != null
              // ignore: dead_code
              ? Image.file(
                  _storeImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  'No image Taken',
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: TextButton.icon(
          icon: Icon(Icons.camera),
          label: Text('Takeb A Photo'),
          onPressed: _takePicture,
        )),
      ],
    );
  }
}
