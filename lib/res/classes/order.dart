class Order {
  final int id;
  final String clientName;
  final String date;
  final String list; // '2&ch.png 1&st.svg 1&cup.png'

  Order({
    required this.id,
    required this.clientName,
    required this.date,
    required this.list
  });
}