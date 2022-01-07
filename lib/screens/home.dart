import 'package:e_shaurma/res/classes/app_card.dart';
import 'package:e_shaurma/res/classes/app_medium_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<AppCard> _menuList = [

  ];

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
                      padding: EdgeInsets.only(top: 15),
                  ),
                  AppMediumText(AppLocalizations.of(context)!.homeListTitle,),
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
                              image: Image(
                                image: AssetImage('lib/res/img/shaurma/st.png'),
                              ),
                            ),
                            AppCard(
                              title: AppLocalizations.of(context)!.stShawerma_jpg,
                              image: Image(
                                image: AssetImage('lib/res/img/shaurma/st.jpg'),
                              ),
                            ),
                            AppCard(
                              title: AppLocalizations.of(context)!.stShawerma_svg,
                              image: Image(
                                image: AssetImage('lib/res/img/shaurma/st.svg.png'),
                              ),
                            ),
                            AppCard(
                              title: AppLocalizations.of(context)!.chShawerma_png,
                              image: Image(
                                image: AssetImage('lib/res/img/shaurma/ch.png'),
                              ),
                            ),
                            AppCard(
                              title: AppLocalizations.of(context)!.chShawerma_jpg,
                              image: Image(
                                image: AssetImage('lib/res/img/shaurma/ch.jpg'),
                              ),
                            ),
                            AppCard(
                              title: AppLocalizations.of(context)!.chShawerma_svg,
                              image: Image(
                                image: AssetImage('lib/res/img/shaurma/ch.svg.png'),
                              ),
                            ),
                            AppCard(
                              title: AppLocalizations.of(context)!.cup_png,
                              image: Image(
                                image: AssetImage('lib/res/img/cup/cup.png'),
                              ),
                            ),
                            AppCard(
                              title: AppLocalizations.of(context)!.cup_jpg,
                              image: Image(
                                image: AssetImage('lib/res/img/cup/cup.jpg'),
                              ),
                            ),
                            AppCard(
                              title: AppLocalizations.of(context)!.cup_svg,
                              image: Image(
                                image: AssetImage('lib/res/img/cup/cup.svg.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                    ),
                    child: TextButton(
                      onPressed: () {

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
