import 'package:e_shaurma/db/database_provider.dart';
import 'package:e_shaurma/res/classes/order.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late List<Order> orders;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshOrders();
  }

  Future refreshOrders() async {
    setState(() {
      isLoading = true;
    });

    this.orders = await DatabaseProvider.dbProvider.getOrders();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        backgroundColor: Colors.orange,
        title: Text(
          AppLocalizations.of(context)!.drawerViewOrders,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700
          ),
        ),
        iconTheme: const IconThemeData(
            color: Colors.black
          )
      ),
      body: isLoading ? CircularProgressIndicator() : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return Text(orders[index].date);
        }
      ),
    );
  }
}
