import 'package:eslami_app/hadeth/ItemHadethName.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../AppColors.dart';

class HadethTab extends StatefulWidget {
  static const String screenRoute = 'quraan_tab';

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    load_hadeth_file();
    return Column(
      children: [
        Expanded(
            child:
                Image(image: AssetImage('assets/images/hadith_tab_logo.png'))),
        Divider(
          thickness: 3,
          color: AppColors.light_primary_color,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Divider(
          thickness: 3,
          color: AppColors.light_primary_color,
        ),
        Expanded(
          flex: 2,
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.light_primary_color,
                  thickness: 1,
                );
              },
              itemCount: ahadethList.length,
              itemBuilder: (context, index) {
                return ItemHadethName(hadeth: ahadethList[index]);
              }),
        )
      ],
    );
  }

  void load_hadeth_file() async {
    String hadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadeth_list = hadethContent.split('#\r\n');
    for (int i = 0; i < hadeth_list.length; i++) {
      List<String> hadeth_lines = hadeth_list[i].split('\n');
      String title = hadeth_lines[0];

      hadeth_lines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadeth_lines);
      ahadethList.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}
