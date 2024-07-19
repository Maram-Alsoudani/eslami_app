import 'package:eslami_app/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/AppConfigProvider.dart';

class RadioTab extends StatelessWidget {
  static const String screenRoute = 'radio_tab';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: AssetImage('assets/images/radio_tab_logo.png')),
        SizedBox(
          height: 30,
        ),
        Text(AppLocalizations.of(context)!.radio,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: provider.appTheme == ThemeMode.light
                      ? AppColors.black
                      : AppColors.yellow,
                )),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.skip_previous,
                  size: 40,
                  color: AppColors.light_primary_color,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.play_arrow,
                    size: 40, color: AppColors.light_primary_color)),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.skip_next,
                    size: 40, color: AppColors.light_primary_color))
          ],
        )
      ],
    );
  }
}
