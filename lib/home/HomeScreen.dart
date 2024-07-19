import 'package:eslami_app/AppColors.dart';
import 'package:eslami_app/LanguageBottomSheet.dart';
import 'package:eslami_app/ThemeBottomSheet.dart';
import 'package:eslami_app/hadeth/HadethTab.dart';
import 'package:eslami_app/providers/AppConfigProvider.dart';
import 'package:eslami_app/quraan/quraan_tab.dart';
import 'package:eslami_app/radio/radio_tab.dart';
import 'package:eslami_app/sebha/SebhaTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

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
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        Image(
            image: provider.appTheme == ThemeMode.light
                ? AssetImage('assets/images/main_background.png')
                : AssetImage('assets/images/main_background_dark.png')),
        Scaffold(
          drawer: Drawer(
            backgroundColor: provider.appTheme == ThemeMode.light
                ? AppColors.light_primary_color
                : AppColors.dark_primary_color,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.settings,
                    style: TextStyle(
                        color: provider.appTheme == ThemeMode.light
                            ? AppColors.black
                            : AppColors.white),
                  ),
                  InkWell(
                    onTap: () {
                      showLanguageBottomSheet();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.language,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_drop_down_sharp,
                              size: 40,
                            ))
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.white,
                    thickness: 1,
                  ),
                  InkWell(
                    onTap: () {
                      showThemeBottomSheet();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.theme,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_drop_down_sharp,
                              size: 40,
                            ))
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.white,
                    thickness: 1,
                  )
                ],
              ),
            ), // Populate the Drawer in the last step.
          ),
          appBar: AppBar(
            leading: Builder(
              builder: (context) {
                return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(
                      Icons.settings,
                      color: provider.appTheme == ThemeMode.light
                          ? AppColors.black
                          : AppColors.white,
                    ));
              },
            ),
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

  showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }

  showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }
}
