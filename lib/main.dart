import 'package:eslami_app/MyAppTheme.dart';
import 'package:eslami_app/home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('en'),
      debugShowCheckedModeBanner: false,
      initialRoute: Homescreen.screenRoute,
      routes: {Homescreen.screenRoute: (context) => Homescreen()},
      theme: MyAppTheme.lightMode,
    );
  }
}
