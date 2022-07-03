import 'package:flutter/material.dart';

class ItemPicture extends StatelessWidget {
  const ItemPicture({required this.assetPath, Key? key}) : super(key: key);

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(assetPath,
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.4,
        fit: BoxFit.fitHeight,
        alignment: Alignment.bottomLeft);
  }
}
