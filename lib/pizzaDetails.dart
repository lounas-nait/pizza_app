import 'package:flutter/material.dart';
import 'StackImage.dart';
import 'appBarTitre.dart';
import 'bottomBarMenu.dart';
import 'package:archi_pizza/favorisWidget.dart';
import 'recette.dart';

class Pizzadetails extends StatefulWidget {
  const Pizzadetails({super.key, required this.recette});
  final Recette recette;

  @override
  State<Pizzadetails> createState() => _PizzadetailsState();
}

class _PizzadetailsState extends State<Pizzadetails> {
  double _quantite = 1;

  @override
  Widget build(BuildContext context) {
    final recette = widget.recette;

    Widget _liste(String texte){
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Row(
          children: [
            Text('. ', style: TextStyle(fontSize: 16),),
            Expanded(child: Text(texte))
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBarTitre(title: recette.title, bgColor: Color.fromRGBO(255, 0, 0, 0.8)),
      bottomNavigationBar: Bottombarmenu(),
      body: ListView(
        children: [
          StackImage(imgUrl: recette.imageUrl),
          Row(
            children: [
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 15,
                            top: 15,
                            right: 15,
                            bottom: 0
                        ),
                        child: Text(recette.title,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: Text(recette.user,
                          style: TextStyle(
                              color: Colors.grey.shade700
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, top: 4),
                child: Text(
                  '${recette.price.toStringAsFixed(2)} €',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              FavorisWidget(isFavorited: recette.isFavorite, favorisCount: recette.favoriteCount),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quantité : ${_quantite.toInt()}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Slider(
                  value: _quantite,
                  min: 1,
                  max: 10,
                  divisions: 9,
                  activeColor: Colors.red,
                  label: _quantite.toInt().toString(),
                  onChanged: (value) {
                    setState(() {
                      _quantite = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Icon(
                          Icons.comment,
                          color: Colors.black
                      ),
                    ),
                    Text('Commenter', style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400
                    ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Icon(
                          Icons.share,
                          color: Colors.black
                      ),
                    ),
                    Text('Partager', style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400
                    ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Text(recette.description),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _liste('Farine'),
              _liste('Levure'),
              _liste('Sel'),
              _liste('Fromage')
            ],
          )
        ],
      ),
    );
  }
}