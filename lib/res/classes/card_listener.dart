import 'order.dart';

class CardListener {
  Order _order = Order(id: 0, clientName: 'test');

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
    _order.removeAll();
  }
}