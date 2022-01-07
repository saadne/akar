import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HouseDetails extends StatefulWidget {
  const HouseDetails({Key? key}) : super(key: key);

  @override
  _HouseDetailsState createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Details",
            style: TextStyle(),
          ),
          centerTitle: true,
          backgroundColor: Colors.indigo[900],
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
        body: Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Column(
              children: [
                SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "assets/pexels-photo-186077.jpeg",
                    height: 150,
                    width: 1000,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),
                Column(
                  children: [
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40)),
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
                  ],
                ),
                SizedBox(height: 8),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 20),
                              Icon(FontAwesomeIcons.bed, size: 16),
                              Text(
                                "  Chambers: ",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "6",
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Icon(Icons.kitchen, size: 16),
                              Text(
                                "  Cuisines: ",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "6",
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.bath, size: 16),
                              Text(
                                "  Toilettes: ",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "2",
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      SizedBox(width: 75),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.garage, size: 16),
                              Text(
                                "  Garages: ",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "2",
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Icon(Icons.space_dashboard, size: 16),
                              Text(
                                "  Surface: ",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "400",
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  "assets/meubler.png",
                                  height: 20,
                                  width: 20,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                "  Meubler: ",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Oui",
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                      ],
                    )),
                SizedBox(height: 5),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Information sur le courtier",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Card(
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  "assets/logo.png",
                                  height: 70,
                                  width: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Mohamed Sidi",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      "33645471",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 5)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )));
  }
}
