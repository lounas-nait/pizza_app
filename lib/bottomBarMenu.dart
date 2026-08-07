import 'package:flutter/material.dart';

class Bottombarmenu extends StatelessWidget {
  const Bottombarmenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.red,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Photos'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Messages'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Messages'
          ),
        ]
    );
  }
}
