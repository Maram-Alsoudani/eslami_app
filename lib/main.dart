import 'package:eslami_app/MyAppTheme.dart';
import 'package:eslami_app/hadeth/HadethDetails.dart';
import 'package:eslami_app/hadeth/HadethTab.dart';
import 'package:eslami_app/home/HomeScreen.dart';
import 'package:eslami_app/providers/AppConfigProvider.dart';
import 'package:eslami_app/quraan/SuraDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      debugShowCheckedModeBanner: false,
      initialRoute: Homescreen.screenRoute,
      routes: {
        Homescreen.screenRoute: (context) => Homescreen(),
        SuraDetails.screenRoute: (context) => SuraDetails(),
        HadethTab.screenRoute: (context) => HadethTab(),
        HadethDetails.screenRoute: (context) => HadethDetails()
      },
      themeMode: provider.appTheme,
      theme: MyAppTheme.lightMode,
      darkTheme: MyAppTheme.darkMode,
    );
  }
}
