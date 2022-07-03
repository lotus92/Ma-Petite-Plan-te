import 'package:exercicempp/Components/SubTitle.dart';
import 'package:exercicempp/Components/FloatingButton.dart';
import 'package:exercicempp/Components/Title.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainPageHeader extends StatelessWidget {
  const MainPageHeader({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    String weekday = DateFormat.EEEE().format(DateTime.now());
    String month = DateFormat.MMMM().format(DateTime.now());
    int day = DateTime.now().day;
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubTitle(
                    color: Colors.grey[500]!,
                    label: "$weekday, $month ${day.toString()}"),
                PageTitle(label: title, color: Colors.green[900]!)
              ],
            ),
            const FloatingButton()
          ],
        ));
  }
}
