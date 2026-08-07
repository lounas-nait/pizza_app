import 'package:flutter/material.dart';
import 'recettesListe.dart';
import 'profilPage.dart';
import 'contactPage.dart';

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
          } else if (index == 2) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ContactPage()),
            );
          } else if (index == 3) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ProfilPage()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Messages'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: 'Contact'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil'
          ),
        ]
    );
  }
}