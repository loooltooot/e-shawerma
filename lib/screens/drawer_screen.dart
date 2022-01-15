import 'package:e_shaurma/db/database_provider.dart';
import 'package:e_shaurma/res/classes/app_medium_text.dart';
import 'package:e_shaurma/res/classes/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                FutureBuilder<String>(
                  future: DatabaseProvider.dbProvider.getClientNameById(0),
                  builder: (BuildContext context, AsyncSnapshot<String> snap) {
                    return AppMediumText(snap.data ?? '');
                  }
                ),
                Text(
                    AppLocalizations.of(context)!.drawerAmountOfShawerma + '13'
                ),
              ],
            ),
          ),
          AppTextButton(
            title: AppLocalizations.of(context)!.drawerViewOrders,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
