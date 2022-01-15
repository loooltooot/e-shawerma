import 'package:e_shaurma/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:e_shaurma/res/classes/app_medium_text.dart';
import 'package:e_shaurma/res/classes/app_route.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'lib/res/img/welcome.png'
            ),
            fit: BoxFit.cover
          )
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(18, 50, 18, 0),
                child: const Text(
                  'E-Shawerma',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
              const Spacer(flex: 2,),
              Container(
                padding: const EdgeInsets.only(left: 29, right: 29),
                child: AppMediumText(AppLocalizations.of(context)!.welcomeText,),
              ),
              const Spacer(flex: 3,),
              Row(
                children: [
                  const Spacer(flex: 1,),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(AppRouteFactory
                          .createRouteRightToLeft(const RegistrationScreen()));
                    },
                    child: Text(
                      AppLocalizations.of(context)!.welcomeButtonText,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        decoration: TextDecoration.underline
                      ),
                    )
                  ),
                  const Padding(padding: EdgeInsets.only(right: 29))
                ]
              ),
              const Spacer(flex: 1,),
            ],
          ),
        ),
      ),
    );
  }
}