import 'dart:convert';
import 'dart:developer';

import 'package:exercicempp/Components/ItemCard.dart';
import 'package:exercicempp/Models/Item.dart';
import 'package:exercicempp/Pages/MainPage.dart';
import 'package:exercicempp/Widgets/CustomList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const assetPath = [
  'assets/data/top.json',
  'assets/data/outdoor.json',
  'assets/data/indoor.json'
];

class MainRoute extends StatelessWidget {
  const MainRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadItems(),
        builder: ((context, snapshot) => Scaffold(
            endDrawer: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/thumbUp.jpeg'))),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.7),
            backgroundColor: Colors.white,
            body: SafeArea(
                child: snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData
                    ? MainPage(items: snapshot.data as List<List<ItemCard>>)
                    : const Center(child: CircularProgressIndicator())))));
  }

  Future<List<List<ItemCard>>> loadItems() async {
    List<List<ItemCard>> items = List.empty(growable: true);
    for (String path in assetPath) {
      items.add(await loadData(dataPath: path)
          .then((value) => value.map((e) => ItemCard(model: e)).toList()));
    }
    return items;
  }

  Future<List> loadData({required String dataPath}) async {
    final String response = await rootBundle.loadString(dataPath);
    final data = await json.decode(response);

    return data.map((e) => ItemModel.fromJson(json: e)).toList();
  }
}
