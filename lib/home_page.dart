import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 File ? file;

 getImage()async{
  final ImagePicker picker = ImagePicker();
  final XFile? imagecamera = await picker.pickImage(source: ImageSource.camera);
  if(imagecamera !=null){
    file = File(imagecamera!.path);
 var refStorge = FirebaseStorage.instance.ref("1.jpg");
 await refStorge.putFile(file!);
  }
  setState(() {});
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Image Picker"),
      centerTitle: true,
    ),
    body: Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          ElevatedButton(
            onPressed: ()async{
              await getImage();
          }, 
          child: Text("Get Image Camera")),
          if(file !=null) Image.file(file!,width: 100,height: 100,fit: BoxFit.fill,)
        ],
      ),
    ),
    );
  }
}

  // Pick an image.
  //final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  // Capture a photo.