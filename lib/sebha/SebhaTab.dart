import 'dart:math';

import 'package:eslami_app/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/AppConfigProvider.dart';

class SebhaTab extends StatefulWidget {
  static const String screenRoute = 'sebha_tab';

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int sebha_counter = 0;
  int index = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر"
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    double angle = (2 * pi / 33) * sebha_counter;
    return Column(
      children: [
        Center(
          child: Expanded(
            child: Stack(
              children: [
                Container(
                  width: 232,
                  height: 320,
                  color: Colors.transparent,
                ),
                Positioned(
                    bottom: 10,
                    child: AnimatedRotation(
                        duration: Duration(microseconds: 300),
                        turns: angle / (2 * pi),
                        child: Image(
                            image: provider.appTheme == ThemeMode.light
                                ? AssetImage('assets/images/sebha_tab_logo.png')
                                : AssetImage(
                                    'assets/images/sebha_tab_logo_dark.png')))),
                Positioned(
                    top: 0,
                    right: 50,
                    child: Image(
                        image: provider.appTheme == ThemeMode.light
                            ? AssetImage('assets/images/head of seb7a.png')
                            : AssetImage(
                                'assets/images/head of seb7a_dark.png'))),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 22,
        ),
        Text(AppLocalizations.of(context)!.number_of_tasbeh,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: provider.appTheme == ThemeMode.light
                      ? AppColors.black
                      : AppColors.yellow,
                )),
        SizedBox(
          height: 22,
        ),
        Container(
          child: Center(
              child: Text(
            '$sebha_counter',
            style: TextStyle(color: AppColors.white),
          )),
          width: 69,
          height: 81,
          decoration: BoxDecoration(
            color: provider.appTheme == ThemeMode.light
                ? AppColors.light_primary_color
                : AppColors.dark_primary_color,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () {
            setState(() {
              sebha_counter++;
              if (sebha_counter == 33) {
                sebha_counter = 0;
                index = (index + 1) % azkar.length;
              }
            });
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                azkar[index],
                style: TextStyle(
                    color: provider.appTheme == ThemeMode.light
                        ? AppColors.white
                        : AppColors.black),
              ),
            ),
            decoration: BoxDecoration(
              color: provider.appTheme == ThemeMode.light
                  ? AppColors.light_primary_color
                  : AppColors.yellow,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        )
      ],
    );
  }
}
