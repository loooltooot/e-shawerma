import 'package:e_shaurma/db/database_provider.dart';
import 'package:e_shaurma/res/classes/app_animated_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'order.dart';

class CardListener {
  Order _order = Order();
  final BuildContext context;

  CardListener({required this.context});

  void addPositionToOrder(String tag) {
    _order.addPosition(tag);
  }

  void removePositionFromOrder(String tag) {
    _order.removePosition(tag);
  }

  int getPositionAmount(String tag) {
    return _order.getPositionAmount(tag);
  }

  void clearOrder() {
    _order = Order();
  }

  bool orderIsEmpty() {
    return _order.list.isEmpty;
  }

  void saveOrder() async {
    DateTime time = DateTime.now();
    DateFormat format = DateFormat('d MMMM, HH:mm', Localizations.localeOf(context).languageCode);
    String date = format.format(time);

    _order.date = date;

    if(!orderIsEmpty()) {
      await DatabaseProvider.dbProvider
          .updateClientAmount(_order.countAmountOfShawermas());
      await DatabaseProvider.dbProvider.insertOrder(_order);
    }
    clearOrder();
  }

  List<AppAnimatedImage> generateAnimatedImageList() {
    List<AppAnimatedImage> result = [];
    Map temp = _order.list;

    temp.forEach((key, value) {
      if(value > 1) {
        for(int i = 0; i < value; i++) {
          result.add(AppAnimatedImage(tag: key));
        }
      } else {
        result.add(AppAnimatedImage(tag: key));
      }
    });

    return result;
  }
}