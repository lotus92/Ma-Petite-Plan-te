import 'dart:developer';

import 'package:exercicempp/Components/ItemCard.dart';
import 'package:exercicempp/Widgets/MainContent/CustomTabBarView.dart';
import 'package:exercicempp/Widgets/MainContent/Header.dart';
import 'package:exercicempp/Widgets/CustomList.dart';
import 'package:flutter/material.dart';

const sectionLabels = ["Top Picks", "OutDoor", "InDoor"];

class MainPage extends StatefulWidget {
  const MainPage({required this.items, Key? key}) : super(key: key);

  final List<List<ItemCard>> items;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  void setIndex({required int newIndex}) => setState(() => index = newIndex);

  @override
  Widget build(BuildContext context) {
    return CustomList(
        separator: SizedBox(height: MediaQuery.of(context).size.height * 0.005),
        headerHeight: 0.23,
        headerShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        header: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07),
            child: MainPageHeader(title: sectionLabels[index])),
        bottom: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07),
            child: DefaultTabController(
                length: sectionLabels.length,
                child: MainPageCustomTabBar(
                    currentIndex: index, onTap: (i) => setIndex(newIndex: i)))),
        content: widget.items[index]);
  }
}
