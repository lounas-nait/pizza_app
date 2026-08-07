import 'package:flutter/material.dart';

class AppBarTitre extends StatelessWidget implements PreferredSizeWidget{
  //Contructeur
  const AppBarTitre({
    super.key,
    required this.title,
    this.bgColor = Colors.red
  });
  //Propriété
  // final obligé à initialisé les propriétes dans le constructeur
  final String title;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

