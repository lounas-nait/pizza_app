import 'package:flutter/material.dart';
import 'recettesListe.dart';

class Bottombarmenu extends StatelessWidget {
  const Bottombarmenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.red,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const RecettesListe()),
              (route) => false,
            );
          }
        },
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