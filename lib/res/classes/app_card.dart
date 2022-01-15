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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 140,
      child: Row(
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(image)
              )
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 10)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),
              AppTileButtons(
                listener: listener,
                tag: semanticTag,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
            ],
          )
        ],
      ),
    );
  }
}
