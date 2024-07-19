import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../AppColors.dart';
import '../providers/AppConfigProvider.dart';

class ItemSuraDetails extends StatelessWidget {
  String content;
  int index;

  ItemSuraDetails({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Text(
      "$content (${index + 1})",
      textDirection: TextDirection.rtl,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: provider.appTheme == ThemeMode.light
                  ? AppColors.black
                  : AppColors.yellow,
            ));
  }
}
