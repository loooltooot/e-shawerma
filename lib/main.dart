import 'package:e_shaurma/db/database_provider.dart';
import 'package:e_shaurma/screens/registration_screen.dart';
import 'package:e_shaurma/screens/welcome_screen.dart';
import 'package:e_shaurma/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
              .apply(
              bodyColor: Colors.black,
              fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru', ''),
        Locale('en', ''),
      ],
      home: FutureBuilder(
        future: DatabaseProvider.dbProvider.getClientNameById(0),
        builder: (context, AsyncSnapshot<String> snap) {
          return snap.data != null || snap.data != '' ? const Home() : const WelcomeScreen();
        },
      ),
    );
  }
}

