import 'package:eslami_app/providers/AppConfigProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'AppColors.dart';

class ThemeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    ThemeMode selectedTheme = provider.appTheme;
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
              provider.changeTheme(ThemeMode.light);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: selectedTheme == ThemeMode.light
                            ? (AppColors.light_primary_color)
                            : (AppColors.white))),
                if (selectedTheme == ThemeMode.light)
                  Icon(Icons.check, color: AppColors.light_primary_color),

                // Icon(Icons.check, color: AppColors.light_primary_color),
              ],
            ),
          ),
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.dark,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: selectedTheme == ThemeMode.dark
                              ? (AppColors.yellow)
                              : (AppColors.black))),
                  if (selectedTheme == ThemeMode.dark)
                    Icon(Icons.check, color: AppColors.yellow)

                  // Icon(Icons.check, color: AppColors.light_primary_color),
                ],
              ))
        ],
      ),
    );
  }
}
