import 'dart:io';
import 'package:akar_project/auth_screens/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

// import 'login_screen.dart';

class AddApartment extends StatefulWidget {
  const AddApartment({Key? key}) : super(key: key);

  @override
  _AddApartmentState createState() => _AddApartmentState();
}

class _AddApartmentState extends State<AddApartment> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  late String imageUrl;

  final TextEditingController regionController = new TextEditingController();
  final TextEditingController cityController = new TextEditingController();
  final TextEditingController priceController = new TextEditingController();
  final TextEditingController roomsController = new TextEditingController();
  final TextEditingController kitchenController = new TextEditingController();
  final TextEditingController bathroomController = new TextEditingController();
  final TextEditingController surfaceController = new TextEditingController();
  final TextEditingController meublerController = new TextEditingController();
  final TextEditingController descriptionController =
      new TextEditingController();
  final TextEditingController floorNumberController =
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
    final rooms = TextFormField(
      autofocus: false,
      controller: roomsController,
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
        roomsController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
          hintText: "Nombre de Chambers",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
    final kitchen = TextFormField(
      autofocus: false,
      controller: kitchenController,
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
        kitchenController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
          hintText: "Nombre de Cuisine",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
    final bathroom = TextFormField(
      autofocus: false,
      controller: bathroomController,
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
        bathroomController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
          hintText: "Nombre de Toiletts",
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
    final floorNumber = TextFormField(
      autofocus: false,
      controller: floorNumberController,
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
        floorNumberController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
          hintText: "Numero d'etage",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
    bool decimal;
    bool signed;
    final Meubler = TextFormField(
      autofocus: false,
      controller: meublerController,
      keyboardType: TextInputType.numberWithOptions(),
      onSaved: (value) {
        meublerController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
          hintText: "Meubler",
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
          addApartment();
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
          title: Text("Ajouter Apartement"),
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
                      rooms,
                      SizedBox(
                        height: 16,
                      ),
                      kitchen,
                      SizedBox(
                        height: 16,
                      ),
                      bathroom,
                      SizedBox(
                        height: 16,
                      ),
                      floorNumber,
                      SizedBox(
                        height: 16,
                      ),
                      surface,
                      SizedBox(
                        height: 16,
                      ),
                      Meubler,
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
                        onPressed: () => uploadImage(),
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

  CollectionReference apartments =
      FirebaseFirestore.instance.collection('apartments');

  Future<void> addApartment() {
    User? user = _auth.currentUser;
    // Call the user's CollectionReference to add a new user
    return apartments
        .add({
          'region': regionController.text, // John Doe
          'city': cityController.text, // Stokes and Sons
          'rooms': roomsController.text,
          'price': priceController.text,
          'kitchen': kitchenController.text,
          'bathroom': bathroomController.text,
          'meubler': meublerController.text,
          'Number_floor': floorNumberController.text,
          'description': descriptionController.text,
          'surface': surfaceController.text,
          'image_url': '',
          'added_by': user!.uid, // 42
        })
        .then((value) => Navigator.pushAndRemoveUntil(
            (context),
            MaterialPageRoute(builder: (context) => Profile()),
            (route) => false))
        .catchError((error) => print("Failed to add houses: $error"));
  }

  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      image = (await _picker.getImage(source: ImageSource.gallery))!;

      var file = File(image.path);
      if (image != null) {
        var snapshot = await _storage
            .ref()
            .child('folderName/imageName')
            .putFile(file)
            .whenComplete(() => null);
        var downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print("No path received");
      }
    } else {
      print("Permision and try again");
    }
  }
}
