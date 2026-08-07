import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';


class StackImage extends StatelessWidget {
  const StackImage({
    super.key,
    required this.imgUrl,
    this.largeur = 600,
    this.hauteur = 270
  });

  final String imgUrl;
  final double largeur;
  final double hauteur;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            width: largeur,
            height: hauteur,
            child: Center(child: CircularProgressIndicator()),
          ),
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: imgUrl,
            width: largeur,
            height: hauteur,
            fit: BoxFit.cover,

          ),
        ]
    );
  }
}