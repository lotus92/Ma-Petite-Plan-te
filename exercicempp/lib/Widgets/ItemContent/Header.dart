import 'package:exercicempp/Components/AddPicture.dart';
import 'package:exercicempp/Components/GeneralPlantInfo.dart';
import 'package:exercicempp/Components/ItemPicture.dart';
import 'package:exercicempp/Components/SubTitle.dart';
import 'package:exercicempp/Components/FloatingButton.dart';
import 'package:exercicempp/Components/Title.dart';
import 'package:flutter/material.dart';

class ItemPageHeader extends StatelessWidget {
  const ItemPageHeader(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.waterDays,
      required this.fertDays,
      Key? key})
      : super(key: key);

  final String title;
  final String subtitle;
  final String image;
  final int waterDays;
  final int fertDays;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.42,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SubTitle(label: subtitle, color: Colors.grey[100]!),
                        PageTitle(label: title, color: Colors.white)
                      ]),
                  const AddPicture(),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GeneralPlantInfo(
                                title: "Water",
                                subtitle: "in ${waterDays.toString()} Days",
                                assetPath: "assets/icons/watering_can.png"),
                            GeneralPlantInfo(
                                title: "Fertilizing",
                                subtitle: "in ${waterDays.toString()} Days",
                                assetPath: "assets/icons/plant.png")
                          ]))
                ]),
            ItemPicture(assetPath: image)
          ],
        ));
  }
}
