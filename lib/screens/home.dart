import 'package:e_shaurma/res/classes/app_card.dart';
import 'package:e_shaurma/res/classes/app_medium_text.dart';
import 'package:e_shaurma/res/classes/app_route.dart';
import 'package:e_shaurma/res/classes/card_listener.dart';
import 'package:e_shaurma/screens/drawer_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CardListener _listener = CardListener();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 350,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'lib/res/img/shawerm.jpg'
                ),
                fit: BoxFit.cover
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(AppRouteFactory
                    .createRouteLeftToRight(const DrawerScreen()));
              },
              icon: const Icon(Icons.menu),
              color: Colors.orange,
              iconSize: 36,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height - 320,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(top: 5),
                  ),
                  AppMediumText(AppLocalizations.of(context)!.homeListTitle,),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overscroll) {
                          overscroll.disallowGlow();
                          return true;
                        },
                        child: ListView(
                          padding: const EdgeInsets.all(5),
                          children: [
                            AppCard(
                              title: AppLocalizations.of(context)!.stShawerma_png,
                              image: 'lib/res/img/shaurma/st.png',
                              semanticTag: 'st.png',
                              listener: _listener,
                            ),
                            const Divider(height: 1.5,),
                            AppCard(
                              title: AppLocalizations.of(context)!.stShawerma_jpg,
                              image: 'lib/res/img/shaurma/st.jpg',
                              semanticTag: 'st.jpg',
                              listener: _listener,
                            ),
                            const Divider(height: 1.5,),
                            AppCard(
                              title: AppLocalizations.of(context)!.stShawerma_svg,
                              image: 'lib/res/img/shaurma/st.svg.png',
                              semanticTag: 'st.svg.png',
                              listener: _listener,
                            ),
                            const Divider(height: 1.5,),
                            AppCard(
                              title: AppLocalizations.of(context)!.chShawerma_png,
                              image: 'lib/res/img/shaurma/ch.png',
                              semanticTag: 'ch.png',
                              listener: _listener,
                            ),
                            const Divider(height: 1.5,),
                            AppCard(
                              title: AppLocalizations.of(context)!.chShawerma_jpg,
                              image: 'lib/res/img/shaurma/ch.jpg',
                              semanticTag: 'ch.jpg',
                              listener: _listener,
                            ),
                            const Divider(height: 1.5,),
                            AppCard(
                              title: AppLocalizations.of(context)!.chShawerma_svg,
                              image: 'lib/res/img/shaurma/ch.svg.png',
                              semanticTag: 'ch.svg.png',
                              listener: _listener,
                            ),
                            const Divider(height: 1.5,),
                            AppCard(
                              title: AppLocalizations.of(context)!.cup_png,
                              image: 'lib/res/img/cup/cup.png',
                              semanticTag: 'cup.png',
                              listener: _listener,
                            ),
                            const Divider(height: 1.5,),
                            AppCard(
                              title: AppLocalizations.of(context)!.cup_jpg,
                              image: 'lib/res/img/cup/cup.jpg',
                              semanticTag: 'cup.jpg',
                              listener: _listener,
                            ),
                            const Divider(height: 1.5,),
                            AppCard(
                              title: AppLocalizations.of(context)!.cup_svg,
                              image: 'lib/res/img/cup/cup.svg.png',
                              semanticTag: 'cup.svg',
                              listener: _listener,
                            ),
                            const Divider(height: 1.5,),
                            AppCard(
                              title: AppLocalizations.of(context)!.tea_png,
                              image: 'lib/res/img/tea.png',
                              semanticTag: 'tea.png',
                              listener: _listener,
                            ),
                            const Divider(height: 1.5,),
                            AppCard(
                              title: AppLocalizations.of(context)!.tea_jpg,
                              image: 'lib/res/img/tea.jpg',
                              semanticTag: 'tea.jpg',
                              listener: _listener,
                            ),
                            const Divider(height: 1.5,),
                            AppCard(
                              title: AppLocalizations.of(context)!.tea_svg,
                              image: 'lib/res/img/tea.svg.png',
                              semanticTag: 'tea.svg.png',
                              listener: _listener,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                    ),
                    child: TextButton(
                      onPressed: () {
                        // todo
                        _listener.saveOrder();
                        setState(() {
                          _listener.clearOrder();
                        });
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(const Color(
                            0xFFD68000
                        )),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.homeMakeOrderButton,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 30
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
