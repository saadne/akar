import 'package:akar_project/auth_screens/bottom_bar_nav.dart';
import 'package:akar_project/auth_screens/profile_screen.dart';
import 'package:akar_project/models/user_model.dart';
import 'package:akar_project/auth_screens/login_screen.dart';
import 'package:akar_project/pages/bottomBarNav.dart';
import 'package:akar_project/pages/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Logout extends StatefulWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
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
      appBar: AppBar(
        title: Text("profile"),
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Text(
                  "Dark",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.bold),
                ),
              ),
              Card(
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    Text(
                      "Are you sure ?",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        RaisedButton(
                          child: Text('Oui'),
                          padding: const EdgeInsets.all(10),
                          textColor: Colors.white,
                          color: Colors.indigo[900],
                          onPressed: () {
                            logout(context);
                          },
                        ),
                        SizedBox(
                          width: 165,
                        ),
                        RaisedButton(
                          child: Text('No'),
                          padding: const EdgeInsets.all(10),
                          textColor: Colors.white,
                          color: Colors.indigo[900],
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => NavBar()));
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Dashboard()));
  }
}

class SizeBox {}
