import 'dart:io';
import 'package:akar_project/auth_screens/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:geolocator/geolocator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class AddHouse extends StatefulWidget {
  const AddHouse({Key? key}) : super(key: key);

  @override
  _AddHouseState createState() => _AddHouseState();
}

class _AddHouseState extends State<AddHouse> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  late String imageUrl;
  late Position cl;

  final TextEditingController regionController = new TextEditingController();
  final TextEditingController cityController = new TextEditingController();
  final TextEditingController priceController = new TextEditingController();
  final TextEditingController roomsController = new TextEditingController();
  final TextEditingController kitchenController = new TextEditingController();
  final TextEditingController bathroomController = new TextEditingController();
  final TextEditingController garageController = new TextEditingController();
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
    final garage = TextFormField(
      autofocus: false,
      controller: garageController,
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
        garageController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
          hintText: "Nombre de Garage",
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
          hintText: "Nombre d'etage",
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
          addHouse();
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
          title: Text("Ajouter Maison"),
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
                      garage,
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
                      RaisedButton(
                        child: Text("Localisation",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                        onPressed: () => getLatAndLong(),
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

  CollectionReference houses = FirebaseFirestore.instance.collection('houses');

  Future<void> addHouse() {
    User? user = _auth.currentUser;
    uploadFile();
    // Call the user's CollectionReference to add a new user
    return houses
        .add({
          'region': regionController.text, // John Doe
          'city': cityController.text, // Stokes and Sons
          'rooms': roomsController.text,
          'price': priceController.text,
          'kitchen': kitchenController.text,
          'bathroom': bathroomController.text,
          'garage': garageController.text,
          'surface': surfaceController.text,
          'meubler': meublerController.text,
          'floorNumber': floorNumberController.text,
          'image_url': imagesList,
          'description': descriptionController.text,
          'location': GeoPoint(cl.latitude, cl.longitude),
          'added_by': user!.uid, // 42
        })
        .then((value) => Navigator.pushAndRemoveUntil(
            (context),
            MaterialPageRoute(builder: (context) => Profile()),
            (route) => false))
        .catchError((error) => print("Failed to add houses: $error"));
  }

  final picker = ImagePicker();
  List<File> image_url = [];
  List imagesList = [];
  late firebase_storage.Reference ref;

  chooseImage() async {
    final PickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      image_url.add(File(PickedFile!.path));
    });
    if (PickedFile!.path == null) ;
  }

  Future<void> retrievedData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        image_url.add(File(response.file!.path));
      });
    } else {
      print(response.file);
    }
  }

  Future uploadFile() async {
    for (var img in image_url) {
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images_houses/${path.basename(img.path)}');
      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          setState(() {
            imagesList.add(value);
          });
        });
      });
    }
  }

  Future getPosition() async {
    bool services;
    LocationPermission per;

    // var distanceBetween = Geolocator.distanceBetween(
    //      cl.altitude, cl.longitude, 32.671749, 55.320313) /
    //  1000;

    services = await Geolocator.isLocationServiceEnabled();
    print(services);
    if (services == false) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.INFO,
        animType: AnimType.BOTTOMSLIDE,
        title: 'services off',
        desc: 'please enable services',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      )..show();
    }
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      if (per == LocationPermission.always ||
          per == LocationPermission.whileInUse) {
        // getLatAndLong();
      }
    }
    print("mmmmmmmmmm");
    print(per);
    print("mmmmmmmmmmmmmmmm");
    // print(services);
  }

  Future<Position> getLatAndLong() async {
    return cl = await Geolocator.getCurrentPosition().then((value) => value);
  }
}
