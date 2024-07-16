import 'package:eslami_app/hadeth/HadethTab.dart';
import 'package:eslami_app/quraan/quraan_tab.dart';
import 'package:eslami_app/radio/radio_tab.dart';
import 'package:eslami_app/sebha/SebhaTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Homescreen extends StatefulWidget {
  static const String screenRoute = 'HomeScreen';

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int selected_index = 0;
  List<Widget> tabs = [QuraanTab(), HadethTab(), SebhaTab(), RadioTab()];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(image: AssetImage('assets/images/main_background.png')),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title),
          ),
          body: tabs[selected_index],
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: selected_index,
              onTap: (index) {
                selected_index = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.quraan,
                    icon:
                        ImageIcon(AssetImage('assets/images/quraan_icon.png'))),
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.hadeth,
                    icon:
                        ImageIcon(AssetImage('assets/images/hadeth_icon.png'))),
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.sebha,
                    icon:
                        ImageIcon(AssetImage('assets/images/sebha_icon.png'))),
                BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.radio,
                    icon: ImageIcon(AssetImage('assets/images/radio_icon.png')))
              ],
            ),
          ),
        )
      ],
    );
  }
}
