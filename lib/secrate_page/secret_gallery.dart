import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SecretGallery extends StatefulWidget {
  SecretGallery({Key? key}) : super(key: key);

  @override
  State<SecretGallery> createState() => _SecretGalleryState();
}

class _SecretGalleryState extends State<SecretGallery> {

  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList =[];
  void selectImage()async{
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if(selectedImages!.isNotEmpty){
      imageFileList!.addAll(selectedImages);
    }
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children:<Widget> [
          Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: imageFileList!.length,
                  itemBuilder: (BuildContext context, int index){
                    return Image.file(File(imageFileList[index].path),fit: BoxFit.cover,);
                  },

                ),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectImage();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
