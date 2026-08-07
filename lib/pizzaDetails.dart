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

  final List<Map<String, String>> _commentaires = [
    {'auteur': 'Loona.', 'texte': 'Délicieuse, on s\'y ressert deux fois !'},
    {'auteur': 'Stan.', 'texte': 'La pâte est parfaitement croustillante.'},
    {'auteur': 'Fionna.', 'texte': 'Un peu trop salée à mon goût mais très bonne.'},
  ];

  final TextEditingController _commentaireController = TextEditingController();

  void _ouvrirFormulaireCommentaire() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Ajouter un commentaire'),
          content: TextField(
            controller: _commentaireController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Votre avis sur cette pizza...',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Annuler'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                if (_commentaireController.text.isEmpty) {
                  return;
                }
                setState(() {
                  _commentaires.add({
                    'auteur': 'Moi',
                    'texte': _commentaireController.text,
                  });
                });
                _commentaireController.clear();
                Navigator.of(context).pop();
              },
              child: Text('Publier', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

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
                GestureDetector(
                  onTap: _ouvrirFormulaireCommentaire,
                  child: Column(
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
          ),
          const Divider(height: 30, thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Commentaires',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          ..._commentaires.map((commentaire) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.red.shade100,
                    child: Icon(Icons.person, size: 18, color: Colors.red),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          commentaire['auteur']!,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(commentaire['texte']!),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}