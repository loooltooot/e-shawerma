import 'package:e_shaurma/db/database_provider.dart';

import 'order.dart';

class CardListener {
  Order _order = Order();

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

  void saveOrder() async {
    DateTime time = DateTime.now();
    String date = '';

    date += time.day.toString() + ', ';
    date += time.month.toString() + ' ';
    date += time.hour.toString() + '.';
    date += time.minute.toString();

    _order.date = date;
    await DatabaseProvider.dbProvider.insertOrder(_order);
  }
}