import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:missing/widgets/description_textfield.dart';
import 'package:missing/widgets/textfield.dart';

import '../const.dart';

class UploadPostPage extends StatefulWidget {
  const UploadPostPage({super.key});

  @override
  State<UploadPostPage> createState() => _UploadPostPageState();
}

class _UploadPostPageState extends State<UploadPostPage> {

  final descriptionCroller = TextEditingController();
  final missingname = TextEditingController();
  final missingdate = TextEditingController();
  final numero = TextEditingController();

  File? _image;
  bool _uploading = false;

  Future selectImage() async {
    try {
      final pickedFile = await ImagePicker.platform.getImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print("no image has been selected");
        }
      });

    } catch(e) {
      toast("some error occured $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Post'),
          centerTitle: true,
          primary: true,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.check_circle,color: Colors.green,size: 30,),
                onPressed: () {
                  // Action when the icon is pressed

                },
              ),
            ),
          ],
        ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                selectImage();
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.height * 0.10,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add,size:50, color: Colors.white,),
                          Text('Appuyer pour Telecharger une Image',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/img_1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          DescriptionField(
              onChanged: (String value) {},
              controller: descriptionCroller,
              hintText: 'Description',
            obscureText: false,),
          Textfield(
            onChanged: (String value) {  },
            controller: missingname,
            hintText: 'Nom et Prenom du disparu',
            ObscureText: false,),
          Textfield(
            onChanged: (String value) {  },
            controller: missingdate,
            hintText: 'Date De disparution',
            ObscureText: false,),
          Textfield(
            onChanged: (String value) {  },
            controller: numero,
            hintText: 'Numero a Joindre',
            ObscureText: false,)
        ],
      ),
    );
  }
}
