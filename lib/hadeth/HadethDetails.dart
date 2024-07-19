import 'package:eslami_app/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/AppConfigProvider.dart';
import 'HadethTab.dart';
import 'ItemHadethDetails.dart';

class HadethDetails extends StatefulWidget {
  static const screenRoute = 'hadeth_details';

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    var provider = Provider.of<AppConfigProvider>(context);

    return Stack(
      children: [
        Image(
            image: provider.appTheme == ThemeMode.light
                ? AssetImage('assets/images/main_background.png')
                : AssetImage('assets/images/main_background_dark.png')),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title),
          ),
          body: Container(
            margin: EdgeInsets.only(bottom: 98, right: 29, left: 29),
            width: 354,
            height: 652,
            decoration: BoxDecoration(
                color: provider.appTheme == ThemeMode.light
                    ? AppColors.white
                    : AppColors.dark_primary_color,
                borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    args.title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: provider.appTheme == ThemeMode.light
                                ? AppColors.black
                                : AppColors.yellow,
                          )),
                  Divider(
                    thickness: 1,
                    color: AppColors.light_primary_color,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: args.content.length,
                        itemBuilder: (context, index) {
                          return ItemHadethDetails(
                            content: args.content[index],
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
