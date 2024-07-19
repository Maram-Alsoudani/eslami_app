import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../AppColors.dart';
import '../providers/AppConfigProvider.dart';

class ItemHadethDetails extends StatelessWidget {
  String content;

  ItemHadethDetails({required this.content});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Text(
      content,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: provider.appTheme == ThemeMode.light
              ? AppColors.black
              : AppColors.yellow),
      textAlign: TextAlign.center,
    );
  }
}
