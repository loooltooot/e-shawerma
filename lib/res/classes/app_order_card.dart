import 'package:e_shaurma/res/classes/tag_translator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'order.dart';

class AppOrderCard extends StatelessWidget {
  final Order order;

  const AppOrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TagTranslator translator = TagTranslator(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.ordersListOrderTitle + order.date,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 5)),
          NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
              return true;
            },
            child: ListView.separated(
              primary: false,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: order.list.length,
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              itemBuilder: (context, index) {
                final String title = order.list.keys.elementAt(index);
                final int amount = order.list.values.elementAt(index);

                return Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/res/img/$title')
                        )
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 5)),
                    Text(
                      '${amount}x ${translator.translate(title)}'
                    )
                  ],
                );
              }
            ),
          )
        ],
      ),
    );
  }
}
