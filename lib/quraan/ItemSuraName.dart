import 'package:eslami_app/quraan/SuraDetails.dart';
import 'package:flutter/material.dart';

class ItemSuraName extends StatelessWidget {
  String text;
  int index;

  ItemSuraName({required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetails.screenRoute,
            arguments: SuraDetailsArgs(name: text, index: index));
      },
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
