import 'package:flutter/material.dart';

class FavorisWidget extends StatefulWidget {
  final bool isFavorited;
  final int favorisCount;

  const FavorisWidget({super.key, required this.isFavorited, required this.favorisCount});

  @override
  State<FavorisWidget> createState() => _FavorisWidgetState();
}

class _FavorisWidgetState extends State<FavorisWidget> {
  late bool _isFavorited;
  late int _favorisCount;

  @override
  void initState() {
    super.initState();
    // widget donne accès à l'instance actuelle du statefulWidget
    _isFavorited = widget.isFavorited;
    _favorisCount =  widget.favorisCount;
  }

  void _toggleFavorite(){
    setState(() {
      if(_isFavorited){
        _isFavorited = false;
        _favorisCount -=1;
      }else{
        _isFavorited = true;
        _favorisCount +=1;
      }
    });
  }
  // https://codeshare.io/5gyRyB

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: _toggleFavorite,
            icon: Icon(
              _isFavorited? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
        ),
        Container(
          padding: EdgeInsets.only(right: 15),
          child: Text('$_favorisCount'),
        )
      ],
    );
  }
}

