import 'package:e_shaurma/db/database_provider.dart';
import 'package:e_shaurma/res/classes/app_medium_text.dart';
import 'package:e_shaurma/res/classes/app_route.dart';
import 'package:e_shaurma/res/classes/app_text_button.dart';
import 'package:e_shaurma/res/classes/status_controller.dart';
import 'package:e_shaurma/screens/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(
          color: Colors.black
        )
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 30, top: 5,),
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.orange
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('lib/res/img/avatar.jpg'),
                  radius: 50,
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                FutureBuilder<String>(
                  future: DatabaseProvider.dbProvider.getClientNameById(0),
                  builder: (BuildContext context, AsyncSnapshot<String> snap) {
                    return AppMediumText(snap.data ?? '');
                  }
                ),
                FutureBuilder<String>(
                  future: DatabaseProvider.dbProvider.getClientAmountById(),
                  builder: (BuildContext context, AsyncSnapshot<String> snap) {
                    String amount = snap.hasData ? snap.data.toString() : '0';
                    String status = StatusController.getStatus(int.parse(amount));
                    return Text(
                        AppLocalizations.of(context)!.drawerAmountOfShawerma + amount + status
                    );
                  }
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                AppTextButton(
                  title: AppLocalizations.of(context)!.drawerViewOrders,
                  onPressed: () {
                    Navigator.of(context).push(AppRouteFactory
                        .createRouteLeftToRight(const OrdersScreen()));
                  },
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'catalin software© 2022',
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: Colors.grey
              ),
            ),
          )
        ],
      ),
    );
  }
}
