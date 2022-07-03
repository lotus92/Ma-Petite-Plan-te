import 'package:exercicempp/Models/Item.dart';
import 'package:exercicempp/Pages/ItemPage.dart';
import 'package:flutter/material.dart';

class ItemRoute extends StatelessWidget {
  const ItemRoute({required this.controller, required this.model, Key? key})
      : super(key: key);

  final ItemModel model;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: ItemPage(scrollController: controller, model: model)));
  }
}
