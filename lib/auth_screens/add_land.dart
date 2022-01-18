import 'dart:io';
import 'package:akar_project/auth_screens/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart' ;
import 'package:path/path.dart' as path;

// import 'login_screen.dart';

class AddLand extends StatefulWidget {
  const AddLand({Key? key}) : super(key: key);

  @override
  _AddLandState createState() => _AddLandState();
}

class _AddLandState extends State<AddLand> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  late String imageUrl;

  final TextEditingController regionController = new TextEditingController();
  final TextEditingController cityController = new TextEditingController();
  final TextEditingController priceController = new TextEditingController();
  final TextEditingController lengthController = new TextEditingController();
  final TextEditingController widthController = new TextEditingController();
  final TextEditingController surfaceController = new TextEditingController();
  final TextEditingController descriptionController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final region = TextFormField(
      autofocus: false,
      controller: regionController,
      keyboardType: TextInputType.text,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{4,}$');
        if (value!.isEmpty) {
          return ("Region can't br empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter A Valid Region(Min. 4 Character )");
        }
        return null;
      },
      onSaved: (value) {
        regionController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
          hintText: "Region",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
    final city = TextFormField(
      autofocus: false,
      controller: cityController,
      keyboardType: TextInputType.text,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{4,}$');
        if (value!.isEmpty) {
          return ("Full Name can't br empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter A Valid Full Name(Min. 4 Character )");
        }
        return null;
      },
      onSaved: (value) {
        cityController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
          hintText: "ville",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );

    final price = TextFormField(
      autofocus: false,
      controller: priceController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = new RegExp("^[0-9]");
        if (value!.isEmpty) {
          return ("Phone Number can't be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter A Valid Phone Number");
        }
        return null;
      },
      onSaved: (value) {
        priceController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
          hintText: "Prix",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );

    final length = TextFormField(
      autofocus: false,
      controller: lengthController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = new RegExp("^[0-9]");
        if (value!.isEmpty) {
          return ("Phone Number can't be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter A Valid Phone Number");
        }
        return null;
      },
      onSaved: (value) {
        lengthController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
          hintText: "Longeure",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
    final width = TextFormField(
      autofocus: false,
      controller: widthController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = new RegExp("^[0-9]");
        if (value!.isEmpty) {
          return ("Phone Number can't be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter A Valid Phone Number");
        }
        return null;
      },
      onSaved: (value) {
        widthController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
          hintText: "Largeure",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );

    final surface = TextFormField(
      autofocus: false,
      controller: surfaceController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = new RegExp("^[0-9]");
        if (value!.isEmpty) {
          return ("Phone Number can't be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter A Valid Phone Number");
        }
        return null;
      },
      onSaved: (value) {
        surfaceController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
          hintText: "Surface",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );

    final description = TextFormField(
      autofocus: false,
      controller: descriptionController,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{4,}$');
        if (value!.isEmpty) {
          return ("Full Name can't br empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter A Valid Full Name(Min. 4 Character )");
        }
        return null;
      },
      onSaved: (value) {
        descriptionController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
          hintText: "Description",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );

    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.indigo[900],
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 10, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          addLand();
        },
        child: Text(
          "Ajouter",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("Ajouter Terrain"),
          centerTitle: true,
          backgroundColor: Colors.indigo[900],
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: Colors.indigo[900],
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      region,
                      SizedBox(
                        height: 16,
                      ),
                      city,
                      SizedBox(
                        height: 16,
                      ),
                      price,
                      SizedBox(
                        height: 16,
                      ),
                      length,
                      SizedBox(
                        height: 16,
                      ),
                      width,
                      SizedBox(
                        height: 16,
                      ),
                      surface,
                      SizedBox(
                        height: 16,
                      ),
                      description,
                      SizedBox(
                        height: 25,
                      ),
                      RaisedButton(
                        child: Text("Upload Image",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                        onPressed: () => chooseImage(),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)),
                        elevation: 5.0,
                        color: Colors.white,
                        textColor: Colors.white,
                        padding: EdgeInsets.fromLTRB(120, 12, 120, 12),
                        splashColor: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      signUpButton,
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  CollectionReference lands = FirebaseFirestore.instance.collection('lands');

  Future<void> addLand() {
    User? user = _auth.currentUser;
    uploadFile();
    // Call the user's CollectionReference to add a new user
    return lands
        .add({
          'region': regionController.text, // John Doe
          'city': cityController.text, // Stokes and Sons
          'price': priceController.text,
          'length': lengthController.text,
          'width': widthController.text,
          'surface': surfaceController.text,
          'description': descriptionController.text,
          'image_url': listImages,
          'added_by': user!.uid, // 42
        })
        .then((value) => Navigator.pushAndRemoveUntil(
            (context),
            MaterialPageRoute(builder: (context) => Profile()),
            (route) => false))
        .catchError((error) => print("Failed to add houses: $error"));
  }

  final picker = ImagePicker();
  List <File> image_url = [];
  List listImages = [];
  late firebase_storage.Reference ref;

  chooseImage() async {
    final PickedFile = await  picker.getImage(source: ImageSource.gallery);
    setState(() {
      image_url.add(File(PickedFile!.path));
    });
    if(PickedFile!.path == null ) ;
  }

  Future<void> retrievedData() async {
    final LostData response = await picker.getLostData();
    if(response.isEmpty){
      return;
    }
    if(response.file != null){
      setState(() {
        image_url.add(File(response.file!.path));
      });
    }else{
      print(response.file);
    }
  }

  Future uploadFile() async {
    for(var img in image_url){
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images_lands/${path.basename(img.path)}');
      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          setState(() {
            listImages.add(value);
          });
        });
      });
    }
  }

  
}
