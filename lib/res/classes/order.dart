class Order {
  int? id;
  String date = '';
  Map<String, int> list = {}; // 'ch_png:2 st_svg:1 cup_png:1'

  Order({this.id});

  Order copy({
    int? id,
  }) => Order(id: id ?? this.id);

  Order.fromJSON(Map<String, dynamic> json) {
    id = json['id'] as int;
    date = json['date'] as String;
    list = orderListToMap(json['list'] as String);
  }

  Map<String, dynamic> toJSON() =>
    {
      'id': id,
      'date': date,
      'list': orderListToString(list)
    };

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

  String orderListToString(Map l) {
    String result = '';

    l.forEach((key, value) {
      result += '$key:$value ';
    });

    return result;
  }

  Map<String, int> orderListToMap(String list) {
    Map<String, int> result = {};
    List<String> splitList = list.trim().split(' ');

    splitList.forEach((element) {
      if(element.isNotEmpty) {
        List<String> tempList = element.split(':');
        result.addAll({tempList[0]: int.parse(tempList[1])});
      }
    });

    return result;
  }

  int countAmountOfShawermas() {
    int counter = 0;
    List drinksList = ['tea.png', 'tea.jpg', 'tea.svg.png',
      'cup.png', 'cup.jpg', 'cup.svg.png'];

    list.forEach((key, value) {
      if(!drinksList.contains(key)) counter += value;
    });

    return counter;
  }
}