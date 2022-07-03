import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Scaffold.of(context).openEndDrawer(),
        child: Container(
            padding:
                EdgeInsets.all(MediaQuery.of(context).devicePixelRatio * 5),
            child: Icon(
              Icons.menu_rounded,
              size: 35,
              color: Colors.green[900]!,
            ),
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 1), blurRadius: 10, color: Colors.grey)
            ], borderRadius: BorderRadius.circular(15), color: Colors.white)));
  }
}
