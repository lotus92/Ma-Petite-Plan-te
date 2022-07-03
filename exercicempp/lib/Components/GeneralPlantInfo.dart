import 'package:exercicempp/Components/SubTitle.dart';
import 'package:exercicempp/Components/Title.dart';
import 'package:flutter/material.dart';

class GeneralPlantInfo extends StatelessWidget {
  const GeneralPlantInfo(
      {required this.title,
      required this.subtitle,
      required this.assetPath,
      Key? key})
      : super(key: key);

  final String title;
  final String subtitle;
  final String assetPath;
  @override
  Widget build(BuildContext context) {
    final icon = Container(
        width: MediaQuery.of(context).size.width * 0.15,
        padding: EdgeInsets.all(MediaQuery.of(context).devicePixelRatio * 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Color.fromARGB(255, 144, 189, 146)),
        child: Image.asset(assetPath));
    return Container(
        height: MediaQuery.of(context).size.height * 0.18,
        width: MediaQuery.of(context).size.width * 0.23,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(90, 189, 189, 189)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon,
            Column(children: [
              SubTitle(color: Colors.white, label: title),
              SubTitle(color: Colors.grey[300]!, label: subtitle)
            ])
          ],
        ));
  }
}
