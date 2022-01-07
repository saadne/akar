import 'package:akar_project/auth_screens/add_property.dart';
import 'package:akar_project/models/user_model.dart';
import 'package:akar_project/auth_screens/login_screen.dart';
import 'package:akar_project/auth_screens/apartment_details.dart';
import 'package:akar_project/auth_screens/house_details.dart';
import 'package:akar_project/auth_screens/land_details.dart';
import 'package:akar_project/auth_screens/store_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then(
        (value) => {
              this.loggedInUser = UserModel.fromMap(value.data()),
              setState(() {})
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            houseCard(),
            AppartementCard(),
            StoreCard(),
            LandCard(),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddProperty()));
        },
        tooltip: 'add',
        child: new Icon(Icons.add),
      ),
    );
  }

  Widget houseCard() => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: new InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HouseDetails()));
            },
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: Image.asset(
                    "assets/pexels-photo-186077.jpeg",
                    height: 150,
                    width: 1000,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Maison - Etage 02",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(height: 8),
                Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 36),
                        children: <TextSpan>[
                          TextSpan(
                              text: '30 000 ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 40)),
                          TextSpan(text: 'MRU'),
                          TextSpan(text: '/Mois'),
                        ],
                      ),
                      textScaleFactor: 0.5,
                    )),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Nouakchott Tevraghe Zeina",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "4 ",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(FontAwesomeIcons.bed, size: 20),
                    SizedBox(width: 43),
                    Text(
                      "2 ",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(Icons.kitchen, size: 20),
                    SizedBox(width: 43),
                    Text(
                      "3 ",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(FontAwesomeIcons.bath, size: 22),
                    SizedBox(width: 43),
                    Text(
                      "2 ",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(Icons.garage, size: 20),
                    SizedBox(width: 43),
                    Text(
                      "400 ",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(Icons.space_dashboard, size: 20),
                  ],
                ),
                SizedBox(height: 8),
              ],
            )),
      );

  Widget AppartementCard() => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: new InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ApartmentDetails()));
          },
          child: Column(
            children: [
              SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.asset(
                  "assets/apartment1.jpg",
                  height: 150,
                  width: 1000,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Apartement - Etage 04",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 8),
              Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 36),
                      children: <TextSpan>[
                        TextSpan(
                            text: '15 000 ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40)),
                        TextSpan(text: 'MRU'),
                        TextSpan(text: '/Mois'),
                      ],
                    ),
                    textScaleFactor: 0.5,
                  )),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Nouakchott Tevraghe Zeina",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "4 ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(FontAwesomeIcons.bed, size: 20),
                  SizedBox(width: 70),
                  Text(
                    "1 ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(Icons.kitchen, size: 20),
                  SizedBox(width: 70),
                  Text(
                    "3 ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(FontAwesomeIcons.bath, size: 20),
                  SizedBox(width: 70),
                  Text(
                    "200 ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(Icons.space_dashboard, size: 20),
                ],
              ),
              SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      );

  Widget StoreCard() => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: new InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StoreDetails()));
          },
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.asset(
                  "assets/store1.jpg",
                  height: 150,
                  width: 1000,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Magazin",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 8),
              Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 36),
                      children: <TextSpan>[
                        TextSpan(
                            text: '15 000 ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40)),
                        TextSpan(text: 'MRU'),
                        TextSpan(text: '/Mois'),
                      ],
                    ),
                    textScaleFactor: 0.5,
                  )),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Nouakchott Tevraghe Zeina",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "12 ",
                    style: TextStyle(fontSize: 20),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      "assets/width.png",
                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 112),
                  Text(
                    "18 ",
                    style: TextStyle(fontSize: 20),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      "assets/length.png",
                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 100),
                  Text(
                    "300 ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(Icons.space_dashboard_sharp, size: 20),
                ],
              ),
              SizedBox(height: 5)
            ],
          ),
        ),
      );

  Widget LandCard() => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: new InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LandDetails()));
          },
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.asset(
                  "assets/land1.jpg",
                  height: 150,
                  width: 1000,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Terrain",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 8),
              Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 36),
                      children: <TextSpan>[
                        TextSpan(
                            text: '15 000 ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40)),
                        TextSpan(text: 'MRU'),
                        TextSpan(text: '/Mois'),
                      ],
                    ),
                    textScaleFactor: 0.5,
                  )),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Nouakchott Tevraghe Zeina",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "12 ",
                    style: TextStyle(fontSize: 20),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      "assets/width.png",
                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 112),
                  Text(
                    "18 ",
                    style: TextStyle(fontSize: 20),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      "assets/length.png",
                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 100),
                  Text(
                    "400 ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(Icons.space_dashboard_sharp, size: 20),
                ],
              ),
              SizedBox(height: 5)
            ],
          ),
        ),
      );
}
