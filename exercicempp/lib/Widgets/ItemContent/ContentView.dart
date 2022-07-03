import 'package:exercicempp/Components/SubTitle.dart';
import 'package:exercicempp/Components/Title.dart';
import 'package:exercicempp/Models/Item.dart';
import 'package:flutter/material.dart';

class ContentView extends StatefulWidget {
  const ContentView({Key? key, required this.showButton, required this.content})
      : super(key: key);

  final Map<String, dynamic> content;
  final bool showButton;

  @override
  State<ContentView> createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  List<Widget> widgetsData = [];

  @override
  Widget build(BuildContext context) {
    Container scheduleButton = Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.yellow[800], borderRadius: BorderRadius.circular(15)),
        height: MediaQuery.of(context).size.height * 0.09,
        child: const Text(
          "Change Schedule",
          style: TextStyle(
              letterSpacing: 1.5,
              fontFamily: 'default',
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ));
    widgetsData = widget.showButton
        ? [loadWidgetData(data: widget.content['content'])[0]]
        : loadWidgetData(data: widget.content['content']);
    Widget title = Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: PageTitle(
            size: 35,
            color: const Color.fromARGB(255, 36, 78, 21),
            label: widget.content['title']));
    List<Widget> widgets = [title, const Divider()];
    widgets.addAll(widgetsData);

    return Container(
        height: widget.showButton
            ? MediaQuery.of(context).size.height * 0.48
            : null,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Stack(children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: widgets),
          Positioned(
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height *
                  (widget.showButton ? 0.38 : 2),
              child: GestureDetector(
                  onTap: () => print("Schedule button tapped"),
                  child: scheduleButton))
        ]));
  }

  List<Widget> loadWidgetData({required List<dynamic> data}) {
    return data
        .map((e) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.width * 0.05,
                        top: MediaQuery.of(context).size.width * 0.05),
                    child: PageTitle(
                        size: 23,
                        color: const Color.fromARGB(255, 36, 78, 21),
                        label: e['title'])),
                AnimatedContainer(
                    duration: const Duration(seconds: 5),
                    height: widget.showButton
                        ? (MediaQuery.of(context).size.height * 0.15)
                        : null,
                    child: Text(e['content'],
                        style: const TextStyle(
                            overflow: TextOverflow.fade,
                            color: Color.fromARGB(255, 36, 78, 21),
                            fontSize: 15)))
              ],
            ))
        .toList();
  }
}
