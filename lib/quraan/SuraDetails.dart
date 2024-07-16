import 'package:eslami_app/AppColors.dart';
import 'package:eslami_app/quraan/ItemSuraDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SuraDetails extends StatefulWidget {
  static const screenRoute = 'sura_details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return Stack(
      children: [
        Image(image: AssetImage('assets/images/main_background.png')),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title),
          ),
          body: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppColors.light_primary_color,
                ))
              : Container(
                  margin: EdgeInsets.only(bottom: 98, right: 29, left: 29),
                  width: 354,
                  height: 652,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          args.name,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Divider(
                          thickness: 1,
                          color: AppColors.light_primary_color,
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: verses.length,
                              itemBuilder: (context, index) {
                                return ItemSuraDetails(
                                  content: verses[index],
                                  index: index,
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

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
