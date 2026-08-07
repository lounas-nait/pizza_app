import 'package:flutter/material.dart';
import 'appBarTitre.dart';
import 'bottomBarMenu.dart';

class TemoignagesPage extends StatelessWidget {
  const TemoignagesPage({super.key});

  final List<Map<String, String>> temoignages = const [
    {
      'nom': 'Rex',
      'photo': 'https://tse2.mm.bing.net/th/id/OIP.u9ggSRhH92qYA_OU6216gQHaEl?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
      'texte': 'Woof woof, j\'ai essayé de manger le livreur mais la pizza était encore meilleure. 5 pattes sur 5 !'
    },
    {
      'nom': 'Nala',
      'photo': 'https://tse1.mm.bing.net/th/id/OIP.rNTk7XWnlLmxEdg4ZrLOnAHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
      'texte': 'J\'ai enterré une part dans le jardin pour plus tard. Immense erreur, elle était trop bonne, je suis retournée la déterrer direct.'
    },
    {
      'nom': 'Milo',
      'photo': 'https://media.istockphoto.com/id/991052198/photo/dog-looking-delicious-pizza-licking-chops-isolated.jpg?s=612x612&w=0&k=20&c=n-Gb1hfJIQ3CI1s-ne7prOcAKFixf0MBEL9CmyXFDyw=',
      'texte': 'Mon humain ne veut jamais partager sa pizza. Je lui ai donné une note de 1 étoile pour cette raison, la pizza en vaut 5.'
    },
    {
      'nom': 'Bella',
      'photo': 'https://media.istockphoto.com/id/655721910/photo/pizza-time.jpg?s=612x612&w=0&k=20&c=3wldJqY51MBBTRPe1xhRnwlxvAbqCOLJ0NzIOmy0MsY=',
      'texte': 'J\'ai suivi l\'odeur depuis 3 rues. Meilleure décision olfactive de ma vie de chien.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTitre(title: 'Témoignages'),
      bottomNavigationBar: Bottombarmenu(),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: temoignages.length,
        itemBuilder: (context, index) {
          final temoignage = temoignages[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.red.shade100,
                    backgroundImage: NetworkImage(temoignage['photo']!),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (i) => Icon(Icons.pets, color: Colors.amber, size: 16),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          temoignage['texte']!,
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '- ${temoignage['nom']}',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}