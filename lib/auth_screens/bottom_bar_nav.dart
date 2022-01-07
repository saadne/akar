import 'package:akar_project/auth_screens/logout_screen.dart';
import 'package:akar_project/pages/home_page.dart';
import 'package:akar_project/auth_screens/profile_screen.dart';
import 'package:akar_project/auth_screens/login_screen.dart';
import 'package:akar_project/pages/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  User? user = FirebaseAuth.instance.currentUser;
  // var screens = [Profile(), HomePage(), ActionChip(
  //     label: Text("Logout"),
  //     onPressed: () {
  //       logout(context);
  //     },
  //   )];

  @override
  Widget build(BuildContext context) {
    var screens = [Profile(), HomePage(), Logout()];
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.indigo[900],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        showSelectedLabels: true,
        selectedFontSize: 15,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'LogOut',
              backgroundColor: Colors.white)
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
