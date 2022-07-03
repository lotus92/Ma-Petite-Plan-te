import 'package:exercicempp/Models/Item.dart';
import 'package:exercicempp/Pages/ItemPage.dart';
import 'package:exercicempp/Routes/ItemRoute.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({required this.model, Key? key}) : super(key: key);

  final ItemModel model;
  @override
  Widget build(BuildContext context) {
    Text title = Text(model.title,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white));
    Text subtitle = Text(model.room,
        style: const TextStyle(fontSize: 20, color: Colors.white30));
    Container price = Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 163, 195, 164),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.width * 0.3,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(model.price.toString() + '\$',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          const Text('from',
              style: TextStyle(color: Colors.white54, fontSize: 20))
        ]));
    Container image = Container(
        height: MediaQuery.of(context).size.height * 0.55,
        width: MediaQuery.of(context).size.width * 0.65,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain, image: AssetImage(model.assetPath))));
    Container card = Container(
        width: MediaQuery.of(context).size.width * 0.86,
        height: MediaQuery.of(context).size.height * 0.65,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(148, 16, 73, 0)));
    List<Widget> content = [
      Container(color: Colors.yellow, height: 200, width: 200),
      Container(color: Colors.red, height: 200, width: 200),
      Container(color: Colors.green, height: 200, width: 200),
      Container(color: Colors.blue, height: 200, width: 200)
    ];
    return GestureDetector(
        onTap: () => showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (context) => DraggableScrollableSheet(
                snap: true,
                initialChildSize: 1,
                maxChildSize: 1,
                minChildSize: 0.7,
                builder: (context, controller) => ItemRoute(
                      model: model,
                      controller: controller,
                    ))),
        child: Stack(children: [
          card,
          Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [title, subtitle],
              )),
          Positioned(
              child: image,
              bottom: MediaQuery.of(context).size.height * 0,
              left: MediaQuery.of(context).size.width * 0.03),
          Positioned(child: price, bottom: 0, right: 0)
        ]));
  }
}
