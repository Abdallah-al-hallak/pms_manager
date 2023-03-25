import 'package:flutter/material.dart';
import 'package:pms_manager/utils/colors.dart';
import 'package:pms_manager/utils/styles.dart';
import 'package:pms_manager/utils/widgets/custom_radio_butt.dart';

import 'features/intro/view/page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

enum Languages { arabic, english }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var language = Languages.english;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: LayoutBuilder(
          builder: (p0, p1) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ExpansionTile(
                  iconColor: lightDark,
                  textColor: lightDark,
                  childrenPadding: const EdgeInsets.all(30),
                  tilePadding: const EdgeInsets.symmetric(
                    horizontal: 75,
                  ),
                  title: const Text('Select Your Language'),
                  children: [
                    SizedBox(
                      height: p1.maxHeight / 4,
                      width: p1.maxWidth / 1.5,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: gold,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LanguageRadioRow(
                              groupValue: language,
                              value: Languages.english,
                              onChanged: (value) {
                                //TODO Engilsh logic language
                                setState(() {
                                  language = value!;
                                });
                              },
                              text: 'English',
                            ),
                            LanguageRadioRow(
                              groupValue: language,
                              value: Languages.arabic,
                              onChanged: (value) async {
                                //TODO Arabic logic language
                                setState(() {
                                  language = value!;
                                });
                                await Future.delayed(
                                    const Duration(milliseconds: 500));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PageViewIntro(),
                                    ));
                              },
                              text: 'Arabic',
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
