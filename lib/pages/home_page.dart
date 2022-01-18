import 'package:akar_project/models/user_model.dart';
import 'package:akar_project/pages/apartment_details.dart';
import 'package:akar_project/pages/house_details.dart';
import 'package:akar_project/pages/land_details.dart';
import 'package:akar_project/pages/store_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  List _housesList = [];
  List _apartmentsList = [];
  List _storesList = [];
  List _landsList = [];
  int _housesLength = 0;
  int _apartmentsLength = 0;
  int _storesLength = 0;
  int _landsLength = 0;

  Future getHouses() async {
    try {
      await FirebaseFirestore.instance
          .collection('houses')
          .get()
          .then((value) => {
                value.docs.forEach((element) {
                  setState(() {
                    _housesList.add(element.data());
                  });
                })
              });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getApartment() async {
    try {
      await FirebaseFirestore.instance
          .collection('apartments')
          .get()
          .then((value) => {
                value.docs.forEach((element) {
                  setState(() {
                    _apartmentsList.add(element.data());
                  });
                })
              });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getStores() async {
    try {
      await FirebaseFirestore.instance
          .collection('stores')
          .get()
          .then((value) => {
                value.docs.forEach((element) {
                  setState(() {
                    _storesList.add(element.data());
                  });
                })
              });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getLands() async {
    try {
      await FirebaseFirestore.instance
          .collection('lands')
          .get()
          .then((value) => {
                value.docs.forEach((element) {
                  setState(() {
                    _landsList.add(element.data());
                  });
                })
              });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future countDocuments() async {
    QuerySnapshot _myDoc1 =
        await FirebaseFirestore.instance.collection('houses').get();
    List<DocumentSnapshot> _housesCount = _myDoc1.docs;
    setState(() {
      _housesLength = _housesCount.length;
    });
    QuerySnapshot _myDoc2 =
        await FirebaseFirestore.instance.collection('apartments').get();
    List<DocumentSnapshot> _apartmentsCount = _myDoc2.docs;
    setState(() {
      _apartmentsLength = _apartmentsCount.length;
    });
    QuerySnapshot _myDoc3 =
        await FirebaseFirestore.instance.collection('lands').get();
    List<DocumentSnapshot> _landsCount = _myDoc3.docs;
    setState(() {
      _landsLength = _landsCount.length;
    });
    QuerySnapshot _myDoc4 =
        await FirebaseFirestore.instance.collection('stores').get();
    List<DocumentSnapshot> _storesCount = _myDoc4.docs;
    setState(() {
      _landsLength = _storesCount.length;
    }); // Count of Documents in Collection
  }

  @override
  void initState() {
    super.initState();
    getApartment();
    getHouses();
    getLands();
    getStores();
    countDocuments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  houseCard(),
                  AppartementCard(),
                  StoreCard(),
                  LandCard(),
                ],
              );
            }),
      ),
    );
  }

  Widget houseCard() => ListView.builder(
      shrinkWrap: true,
      itemCount: _housesLength,
      itemBuilder: (context, index) {
        return Card(
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
                    child: Image.network(
                      "${_housesList[index]['image_url']}",
                      height: 150,
                      width: 1000,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Maison - Etage 0${_housesList[index]['floorNumber']}",
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
                                text: '${_housesList[index]['price']} ',
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
                      "${_housesList[index]['region']} ${_housesList[index]['city']}",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "${_housesList[index]['rooms']} ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(FontAwesomeIcons.bed, size: 20),
                      SizedBox(width: 43),
                      Text(
                        "${_housesList[index]['kitchen']} ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(Icons.kitchen, size: 20),
                      SizedBox(width: 43),
                      Text(
                        "${_housesList[index]['bathroom']} ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(FontAwesomeIcons.bath, size: 22),
                      SizedBox(width: 43),
                      Text(
                        "${_housesList[index]['garage']} ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(Icons.garage, size: 20),
                      SizedBox(width: 43),
                      Text(
                        "${_housesList[index]['surface']} ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(Icons.space_dashboard, size: 20),
                    ],
                  ),
                  SizedBox(height: 8),
                ],
              )),
        );
      });

  Widget AppartementCard() => ListView.builder(
      shrinkWrap: true,
      itemCount: _apartmentsLength,
      itemBuilder: (context, index) {
        return Card(
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
                  child: Image.network(
                    "${_apartmentsList[index]['image_url']}",
                    height: 150,
                    width: 1000,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Apartement - Etage 0${_apartmentsList[index]['Number_floor']}",
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
                              text: '${_apartmentsList[index]['price']} ',
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
                    "${_apartmentsList[index]['region']} ${_apartmentsList[index]['city']}",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "${_apartmentsList[index]['bathroom']} ",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(FontAwesomeIcons.bed, size: 20),
                    SizedBox(width: 70),
                    Text(
                      "${_apartmentsList[index]['kitchen']} ",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(Icons.kitchen, size: 20),
                    SizedBox(width: 70),
                    Text(
                      "${_apartmentsList[index]['bathroom']} ",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(FontAwesomeIcons.bath, size: 20),
                    SizedBox(width: 70),
                    Text(
                      "${_apartmentsList[index]['surface']} ",
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
      });

  Widget StoreCard() => ListView.builder(
      shrinkWrap: true,
      itemCount: _landsLength,
      itemBuilder: (context, index) {
        return Card(
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
                  child: Image.network(
                    "${_storesList[index]['image_url']}",
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
                              text: '${_storesList[index]['price']} ',
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
                    "${_apartmentsList[index]['region']} ${_storesList[index]['city']}",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "${_storesList[index]['width']} ",
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
                      "${_storesList[index]['length']} ",
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
                      "${_storesList[index]['surface']} ",
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
      });

  Widget LandCard() => ListView.builder(
      shrinkWrap: true,
      itemCount: _landsLength,
      itemBuilder: (context, index) {
        return Card(
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
                  child: Image.network(
                    "${_landsList[index]['image_url']}",
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
                              text: '${_landsList[index]['price']} ',
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
                    "${_landsList[index]['region']} ${_landsList[index]['city']}",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "${_landsList[index]['width']} ",
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
                      "${_landsList[index]['length']} ",
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
                      "${_landsList[index]['surface']}",
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
      });
}
