import 'package:eslami_app/AppColors.dart';
import 'package:eslami_app/providers/AppConfigProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    String selectedLang = provider.appLanguage;

    return Container(
      decoration: BoxDecoration(
          color: provider.appTheme == ThemeMode.light
              ? AppColors.white
              : AppColors.dark_primary_color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage('en');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.english,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: selectedLang == 'en'
                            ? (provider.appTheme == ThemeMode.light
                                ? (AppColors.light_primary_color)
                                : (AppColors.yellow))
                            : (provider.appTheme == ThemeMode.light
                                ? (AppColors.black)
                                : (AppColors.white))
                        // color: selectedLang == 'en'
                        //     ? AppColors.light_primary_color
                        //     : AppColors.black

                        )),
                if (selectedLang == 'en')
                  Icon(Icons.check, color: AppColors.light_primary_color),
              ],
            ),
          ),
          InkWell(
              onTap: () {
                provider.changeLanguage('ar');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: selectedLang == 'ar'
                              ? (provider.appTheme == ThemeMode.light
                                  ? (AppColors.light_primary_color)
                                  : (AppColors.yellow))
                              : (provider.appTheme == ThemeMode.light
                                  ? (AppColors.black)
                                  : (AppColors.white))
                          // color: selectedLang == 'ar'
                          //     ? AppColors.light_primary_color
                          //     : AppColors.black

                          )),
                  if (selectedLang == 'ar')
                    Icon(Icons.check,
                        color: provider.appTheme == ThemeMode.light
                            ? AppColors.light_primary_color
                            : AppColors.dark_primary_color),
                ],
              ))
        ],
      ),
    );
  }
}
