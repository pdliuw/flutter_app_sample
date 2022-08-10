import 'dart:io';

import 'package:air_design/air_design.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

///
/// ImagePickerPage
class ImagePickerPage extends StatefulWidget {
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  ///
  /// ImagePicker
  final ImagePicker _picker = ImagePicker();

  PickedFile? _pickedFile;

  ///
  /// pickGallery
  void _pickGallery() async {
    final pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
      maxWidth: 200,
      maxHeight: 200,
      imageQuality: 50,
    );
    //ui
    setState(() {
      _pickedFile = pickedFile;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("image picker"),
      ),
      body: Column(
        children: [
          Expanded(
              child: AppCardOutlinedStyleWidget.defaultStyle(
            child: InteractiveViewer(
              minScale: 0.5,
              maxScale: 5.0,
              child: _previewWidget(),
            ),
          )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _pickGallery();
        },
        tooltip: "Pick Image from gallery",
        child: Icon(Icons.photo_library),
      ),
    );
  }

  Widget _previewWidget() {
    if (_pickedFile == null) {
      return Container(
        child: Text("please picker one"),
        alignment: Alignment.center,
      );
    }
    if (kIsWeb) {
      // Why network?
      // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform
      return Image.network(_pickedFile!.path);
    } else {
      return Semantics(child: Image.file(File(_pickedFile!.path)), label: 'image_picker_example_picked_image');
    }
  }
}
