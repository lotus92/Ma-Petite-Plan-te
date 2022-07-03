import 'package:flutter/material.dart';

class ItemPageCustomTabBar extends StatefulWidget {
  const ItemPageCustomTabBar(
      {required this.onTap, required this.currentIndex, Key? key})
      : super(key: key);

  final Function onTap;
  final int currentIndex;
  @override
  State<ItemPageCustomTabBar> createState() => _ItemPageCustomTabBarState();
}

class _ItemPageCustomTabBarState extends State<ItemPageCustomTabBar> {
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
    List<String> labels = ["About", "Tips", "Activity"];
    return TabBar(
        onTap: (index) => setCurrent(index),
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height * 0.005,
            vertical: MediaQuery.of(context).size.height * 0.00),
        indicator: CircleTabIndicator(color: Colors.yellow[800]!, radius: 4),
        tabs: labels
            .map((label) => Container(
                child: Text(label,
                    style: TextStyle(
                        fontFamily: 'Default',
                        color: index == labels.indexOf(label)
                            ? Colors.yellow[800]
                            : Colors.grey[800],
                        fontSize: 16)),
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.026)))
            .toList());
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({required Color color, required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([void onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
