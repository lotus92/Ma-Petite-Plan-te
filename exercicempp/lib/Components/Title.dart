import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle(
      {this.size = 30, required this.color, required this.label, Key? key})
      : super(key: key);

  final String label;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: TextStyle(
            color: color, fontSize: size, fontWeight: FontWeight.bold));
  }
}
