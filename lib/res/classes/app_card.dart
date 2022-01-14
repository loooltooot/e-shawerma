import 'package:e_shaurma/res/classes/app_tile_buttons.dart';
import 'package:e_shaurma/res/classes/card_listener.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final String image;
  final String title;
  final String semanticTag;
  final CardListener listener;

  const AppCard({
    Key? key,
    required this.title,
    required this.image,
    required this.semanticTag,
    required this.listener
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(image)
              )
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          AppTileButtons(
            listener: listener,
            tag: semanticTag,
          ),
        ],
      )
    );
  }
}
