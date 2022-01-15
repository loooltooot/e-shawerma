import 'package:e_shaurma/db/database_provider.dart';
import 'package:e_shaurma/res/classes/app_outlined_button.dart';
import 'package:e_shaurma/res/classes/app_route.dart';
import 'package:e_shaurma/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:e_shaurma/res/classes/app_medium_text.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class RegistrationScreen extends StatefulWidget {

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _userName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 29, right: 29),
              child: SafeArea(
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 50)),
                    AppMediumText(AppLocalizations.of(context)!.registrationTitle,),
                    const Padding(padding: EdgeInsets.only(bottom: 100)),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        onChanged: (input) {
                          _userName = input;
                        },
                        onSubmitted: (input) {
                          if(_userName.trim() != '') {
                            DatabaseProvider.dbProvider.insertClient(_userName);
                            Navigator.of(context).pushReplacement(AppRouteFactory
                                .createRouteRightToLeft(const Home()));
                          }
                          _userName = '';
                        },
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.registrationTextFieldHint,
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.5
                            )
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.5
                            )
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(flex: 1,),
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/res/img/registrationTrim.png'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Positioned(
                  left: 260,
                  child: AppOutlinedButton(
                    onPressed: () {
                      if(_userName.trim() != '') {
                        DatabaseProvider.dbProvider.insertClient(_userName);
                        Navigator.of(context).pushReplacement(AppRouteFactory
                            .createRouteRightToLeft(const Home()));
                      }
                      _userName = '';
                    },
                    title: AppLocalizations.of(context)!.registrationButtonText
                  ),
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}
