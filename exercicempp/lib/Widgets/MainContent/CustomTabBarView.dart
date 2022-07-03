import 'package:flutter/material.dart';

class MainPageCustomTabBar extends StatefulWidget {
  const MainPageCustomTabBar(
      {required this.onTap, required this.currentIndex, Key? key})
      : super(key: key);

  final Function onTap;
  final int currentIndex;
  @override
  State<MainPageCustomTabBar> createState() => _MainPageCustomTabBarState();
}

class _MainPageCustomTabBarState extends State<MainPageCustomTabBar> {
  late int index;

  @override
  void initState() {
    index = widget.currentIndex;
    super.initState();
  }

  void setCurrent(int e) {
    setState(() => index = e);
    widget.onTap(index);
  }

  @override
  Widget build(BuildContext context) {
    List<String> labels = ["Top", "Outdoor", "Indoor"];
    List<Widget> buttons = labels
        .map((label) => Container(
            child: Text(label,
                style: TextStyle(color: Colors.green[900], fontSize: 18)),
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02)))
        .toList();
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(15)),
        child: TabBar(
            onTap: (index) => setCurrent(index),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.005,
                vertical: MediaQuery.of(context).size.height * 0.005),
            indicator: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            tabs: buttons));
  }
}
