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
    Recette(
        "Pizza maison",
        "Par Michel dupont",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCxv_7UxuKCHrglOBjwxbOqTyMqf7v2t7r_w&usqp=CAU",
        "Super ils ont envie de faire dodo !",
        false,
        10
    ),
    Recette(
        "Pizza papa",
        "Par Michel dudu",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCxv_7UxuKCHrglOBjwxbOqTyMqf7v2t7r_w&usqp=CAU",
        "Super ils ont envie de faire dodo !",
        false,
        10
    ),
    Recette(
        "Pizza maman",
        "Par Michel dudu",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCxv_7UxuKCHrglOBjwxbOqTyMqf7v2t7r_w&usqp=CAU",
        "Super ils ont envie de faire dodo !",
        false,
        10
    ),
    Recette(
        "Pizza frérot",
        "Par Michel dudu",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCxv_7UxuKCHrglOBjwxbOqTyMqf7v2t7r_w&usqp=CAU",
        "Super ils ont envie de faire dodo !",
        false,
        10
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTitre(title: 'Liste des pizzas'),
      bottomNavigationBar: Bottombarmenu(),
      body: ListView.builder(
          itemCount: recettes.length,
          itemBuilder: (context, index){
            final recette = recettes[index];
              
            return Dismissible(
                key: Key(recette.title),
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
            
            //return Container(
            //  child: RecetteItemWidget(recette: recette),
            //);
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
      //permet de détecter les intéractions tactiles sur n'importe quel enfant widget
      onTap: (){
        //Navigator.push(context, MaterialPageRoute(builder: (context) => Pizzadetails(recette: recette)));

         Navigator.push(context,
          PageRouteBuilder(
              pageBuilder: (context, animation, secondary) => Pizzadetails(recette: recette),
              transitionsBuilder: (content, animation, secondaryAnimation, child){
                var begin= Offset(0.0, 0.3);
                var end= Offset.zero;
                var twin = Tween(begin: begin, end: end);
               // return SlideTransition(position: animation.drive(twin), child: child,);
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
              ],
            )
          ],
        ) ,
      ),
    );
  }

}