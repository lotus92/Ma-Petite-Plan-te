import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  const SubTitle(
      {this.size = 15, required this.color, required this.label, Key? key})
      : super(key: key);

  final String label;
  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(label, style: TextStyle(fontSize: size, color: color));
  }
}
