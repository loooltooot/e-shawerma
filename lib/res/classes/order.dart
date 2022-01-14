class Order {
  final int id;
  final String clientName;
  String date = '';
  Map<String, int> list = {}; // 'ch_png:2 st_svg:1 cup_png:1'

  Order({
    required this.id,
    required this.clientName,
  }) {
    DateTime time = DateTime.now();

    date += time.day.toString() + ' ';
    date += time.hour.toString() + ' ';
    date += time.minute.toString();
  }

  int getPositionAmount(String tag) {
    if(list.containsKey(tag)) {
      return list[tag]!;
    } else {
      return 0;
    }
  }

  void addPosition(String tag) {
    if(list.containsKey(tag)) {
      if(list[tag]! + 1 <= 9) {
        list[tag] = list[tag]! + 1;
      }
    } else {
      list.addAll({tag: 1});
    }
  }

  void removePosition(String tag) {
    if(list.containsKey(tag)) {
      list[tag] = list[tag]! - 1;
      if(list[tag]! == 0) list.remove(tag);
    }
  }

  void removeAll() {
    list = {};
  }

  void fillMap(String order) {
    List<String> positions = order.split(' ');
    for(String pos in positions) {
      List<String> splitPos = pos.split(':');
      list.addAll({splitPos[0] : int.parse(splitPos[1])});
    }
  }

  @override
  String toString() {
    String result = '';

    list.forEach((key, value) {
      result += '$key:$value ';
    });

    return result;
  }
}