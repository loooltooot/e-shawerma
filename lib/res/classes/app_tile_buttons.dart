import 'package:e_shaurma/res/classes/card_listener.dart';
import 'package:flutter/material.dart';

class AppTileButtons extends StatefulWidget {
  final CardListener listener;
  final String tag;

  const AppTileButtons({
      Key? key,
      required this.listener,
      required this.tag
    }) : super(key: key);

  @override
  _AppTileButtonsState createState() => _AppTileButtonsState();
}

class _AppTileButtonsState extends State<AppTileButtons> {
  @override
  Widget build(BuildContext context) {
    int _counter = widget.listener.getPositionAmount(widget.tag);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        border: Border.all(
          color: Colors.orange,
          width: 1.5,
        )
      ),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.orange
            ),
            child: SizedBox(
              width: 40,
              height: 40,
              child: IconButton(
                splashColor: Colors.orangeAccent,
                splashRadius: 30,
                icon: const Icon(Icons.add),
                onPressed: () {
                  widget.listener.addPositionToOrder(widget.tag);
                  setState(() {
                    _counter = widget.listener.getPositionAmount(widget.tag);
                  });
                },
              ),
            ),
          ),
          SizedBox(
            width: _counter > 0 ? 53 : 0,
            height: _counter > 0 ? 40 : 0,
            child: Row(
              children: [
                const Padding(padding: EdgeInsets.only(right: 5)),
                Expanded(
                  child: Text(
                    _counter.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
                IconButton(
                  splashColor: Colors.orangeAccent,
                  splashRadius: 15,
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    widget.listener.removePositionFromOrder(widget.tag);
                    setState(() {
                      _counter = widget.listener.getPositionAmount(widget.tag);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
