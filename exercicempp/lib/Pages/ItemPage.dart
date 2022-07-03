import 'package:exercicempp/Models/Item.dart';
import 'package:exercicempp/Widgets/CustomList.dart';
import 'package:exercicempp/Widgets/ItemContent/ContentView.dart';
import 'package:exercicempp/Widgets/ItemContent/CustomTabBarView.dart';
import 'package:exercicempp/Widgets/ItemContent/Header.dart';
import 'package:flutter/material.dart';

const sectionLabels = ["About", "Tips", "Activity"];

class ItemPage extends StatefulWidget {
  ItemPage({required this.scrollController, required this.model, Key? key})
      : super(key: key);

  final ItemModel model;
  final ScrollController scrollController;
  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  int index = 0;
  bool isScrolling = false;
  void setIndex({required int newIndex}) => setState(() => index = newIndex);

  @override
  Widget build(BuildContext context) {
    widget.scrollController.addListener(() {
      if (widget.scrollController.position.pixels <= 0) {
        setState(() {
          isScrolling = false;
        });
      } else {
        setState(() {
          isScrolling = true;
        });
      }
    });
    return CustomList(
        scrollController: widget.scrollController,
        separator: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.0),
        headerHeight: 0.43 * 1.1709,
        header: Container(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07),
            child: ItemPageHeader(
              waterDays: widget.model.water,
              fertDays: widget.model.fertilizing,
              image: widget.model.assetPath,
              title: widget.model.title,
              subtitle: widget.model.room,
            )),
        bottom: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07),
            child: DefaultTabController(
                length: sectionLabels.length,
                child: ItemPageCustomTabBar(
                    currentIndex: index, onTap: (i) => setIndex(newIndex: i)))),
        content: [
          ContentView(
              content: index == 0
                  ? widget.model.about
                  : index == 1
                      ? widget.model.tips
                      : widget.model.activity,
              showButton: !isScrolling)
        ]);
  }
}
