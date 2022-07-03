import 'package:exercicempp/Components/ItemCard.dart';
import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
  CustomList(
      {required this.header,
      required this.content,
      required this.bottom,
      required this.headerHeight,
      this.headerShape,
      required this.separator,
      this.scrollController,
      Key? key})
      : super(key: key);

  final ShapeBorder? headerShape;
  final Widget separator;
  final Widget header;
  final List<Widget> content;
  final Widget bottom;
  final ScrollController? scrollController;
  final double headerHeight;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        physics: const ClampingScrollPhysics(),
        controller: scrollController,
        slivers: <Widget>[
          headerHeight == 0.23
              ? SliverAppBar(
                  actions: [Container()],
                  shape: headerShape,
                  automaticallyImplyLeading: false,
                  elevation: 2,
                  snap: true,
                  floating: true,
                  excludeHeaderSemantics: true,
                  toolbarHeight:
                      MediaQuery.of(context).size.height * headerHeight,
                  backgroundColor: Colors.white,
                  flexibleSpace: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [header, bottom, separator]))
              : SliverAppBar(
                  actions: [Container()],
                  shape: headerShape,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  floating: headerHeight == 0.23 ? true : false,
                  excludeHeaderSemantics: true,
                  toolbarHeight:
                      MediaQuery.of(context).size.height * headerHeight,
                  backgroundColor: const Color.fromARGB(255, 124, 157, 114),
                  flexibleSpace: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [header, bottom, separator])),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
                alignment: Alignment.center,
                child: Column(children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height *
                          (index == 0 ? 0.01 : 0)),
                  content[index],
                  SizedBox(
                      height: MediaQuery.of(context).size.height *
                          (index == content.length - 1 ? 0.03 : 0.02))
                ]));
          }, childCount: content.length))
        ]);
  }
}
