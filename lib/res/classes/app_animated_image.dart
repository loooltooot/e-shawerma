import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AppAnimatedImage extends StatefulWidget {
  final String tag;

  const AppAnimatedImage({
    Key? key,
    required this.tag
  }) : super(key: key);

  @override
  State<AppAnimatedImage> createState() => _AppAnimatedImageState();
}

class _AppAnimatedImageState extends State<AppAnimatedImage> {
  double _left = 0;
  double _top = 120;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      child: SizedBox(
        width: 130,
        height: 130,
        child: Image(image: AssetImage('lib/res/img/${widget.tag}'),)
      ),
      duration: const Duration(seconds: 2, milliseconds: 400),
      curve: Cubic(Random().nextDouble(), -0.18, 0.735, 0.045),
      top: _top,
      left: _left == 0 ? MediaQuery.of(context).size.width / 2 - 60 : _left,
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        !.addPostFrameCallback((_) => animate());
  }

  void animate() {
    setState(() {
      _left = Random().nextDouble() * MediaQuery.of(context).size.width;
      _top = MediaQuery.of(context).size.height + 40;
    });
  }
}
