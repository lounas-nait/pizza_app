import 'package:archi_pizza/appBarTitre.dart';
import 'package:archi_pizza/bottomBarMenu.dart';
import 'package:archi_pizza/pizzaDetails.dart';
import 'package:flutter/material.dart';
import 'StackImage.dart';
import 'recette.dart';

class RecettesListe extends StatefulWidget {
  const RecettesListe({super.key});

  @override
  State<RecettesListe> createState() => _RecettesListeState();
}

class _RecettesListeState extends State<RecettesListe> {

  final List<Recette> recettes = [
    Recette(1, "Pizza maison", "Par Michel dupont", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCxv_7UxuKCHrglOBjwxbOqTyMqf7v2t7r_w&usqp=CAU", "Super ils ont envie de faire dodo !", false, 10, 17.99),
    Recette(2, "Pizza papa", "Par Michel dudu", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCxv_7UxuKCHrglOBjwxbOqTyMqf7v2t7r_w&usqp=CAU", "Super ils ont envie de faire dodo !", false, 10, 15.99),
    Recette(3, "Pizza maman", "Par Michel dudu", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCxv_7UxuKCHrglOBjwxbOqTyMqf7v2t7r_w&usqp=CAU", "Super ils ont envie de faire dodo !", false, 10, 25.99),
    Recette(4, "Pizza frérot", "Par Michel dudu", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCxv_7UxuKCHrglOBjwxbOqTyMqf7v2t7r_w&usqp=CAU", "Super ils ont envie de faire dodo !", false, 10, 13.99),
  ];

  final TextEditingController _titreController = TextEditingController();
  final TextEditingController _auteurController = TextEditingController();
  final TextEditingController _prixController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  void _ouvrirFormulaireAjout() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Ajouter une pizza'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titreController,
                  decoration: InputDecoration(labelText: 'Nom de la pizza'),
                ),
                TextField(
                  controller: _auteurController,
                  decoration: InputDecoration(labelText: 'Auteur (ex: Par Michel)'),
                ),
                TextField(
                  controller: _prixController,
                  decoration: InputDecoration(labelText: 'Prix (ex: 12.50)'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                TextField(
                  controller: _imageController,
                  decoration: InputDecoration(labelText: 'URL de l\'image'),
                ),
              ],
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
                if (_titreController.text.isEmpty || _imageController.text.isEmpty) {
                  return;
                }
                final nouvelId = recettes.isEmpty
                    ? 1
                    : recettes.map((r) => r.id).reduce((a, b) => a > b ? a : b) + 1;
                setState(() {
                  recettes.add(
                    Recette(
                      nouvelId,
                      _titreController.text,
                      _auteurController.text.isEmpty ? 'Par un ami' : _auteurController.text,
                      _imageController.text,
                      'Une nouvelle recette délicieuse !',
                      false,
                      0,
                      double.tryParse(_prixController.text) ?? 0.0,
                    ),
                  );
                });
                _titreController.clear();
                _auteurController.clear();
                _prixController.clear();
                _imageController.clear();
                Navigator.of(context).pop();
              },
              child: Text('Ajouter', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTitre(title: 'Liste des pizzas'),
      bottomNavigationBar: Bottombarmenu(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: _ouvrirFormulaireAjout,
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: ListView.builder(
          itemCount: recettes.length,
          itemBuilder: (context, index){
            final recette = recettes[index];
              
            return Dismissible(
                key: Key(recette.id.toString()),
                onDismissed: (direction){
                  setState(() {
                    recettes.removeAt(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('${recette.title} supprimé',
                            style: TextStyle(
                              color: Colors.black
                            ),
                            ),
                            backgroundColor: Colors.orangeAccent,
                        ));
                  });
                },
              background: Container(color: Colors.red,),
                child: RecetteItemWidget(recette: recette),
            );
          }
      ),
    );
  }
}

class RecetteItemWidget extends StatelessWidget{

  const RecetteItemWidget({super.key, required this.recette});
  final Recette recette;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         Navigator.push(context,
          PageRouteBuilder(
              pageBuilder: (context, animation, secondary) => Pizzadetails(recette: recette),
              transitionsBuilder: (content, animation, secondaryAnimation, child){
                var begin= Offset(0.0, 0.3);
                var end= Offset.zero;
                var twin = Tween(begin: begin, end: end);
               animation = CurvedAnimation(parent: animation, curve: Curves.ease);
               return FadeTransition(opacity: animation, child: child);
              }
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8),
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white24,
        elevation: 8,
        child: Row(
          children: [
            StackImage(imgUrl: recette.imageUrl, largeur: 100, hauteur: 100,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15,bottom: 5),
                  child: Text(
                    recette.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    recette.user,
                    style: TextStyle(
                        color: Colors.grey.shade700
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, top: 4),
                  child: Text(
                    '${recette.price.toStringAsFixed(2)} €',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            )
          ],
        ) ,
      ),
    );
  }

}