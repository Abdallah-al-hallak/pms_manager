import 'package:flutter/material.dart';
import 'package:pms_manager/utils/colors.dart';
import 'package:pms_manager/utils/styles.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpansionTile(
              childrenPadding: const EdgeInsets.all(30),
              tilePadding: const EdgeInsets.symmetric(
                horizontal: 75,
              ),
              title: const Text('Select Your Language'),
              children: [
                SizedBox(
                  height: 100,
                  width: 200,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: gold,
                    ),
                    child: Column(
                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: RadioListTile<Languages>(
                            activeColor: Colors.white,
                            value: Languages.english,
                            groupValue: language,
                            secondary: Text(
                              'English',
                              style: standardTextStyle(),
                            ),
                            toggleable: true,
                            onChanged: (value) {
                              setState(() {
                                language = value!;
                              });
                              //TODO Navigate to view
                              // Navigator.pushReplacement(context, newRoute);
                            },
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: RadioListTile(
                            activeColor: Colors.white,
                            value: Languages.arabic,
                            groupValue: language,
                            secondary: Text(
                              'Arabic',
                              style: standardTextStyle(),
                            ),
                            toggleable: true,
                            onChanged: (value) {
                              //TODO Arabic logic language
                              setState(() {
                                language = value!;
                              });
                            },
                          ),
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
    );
  }
}
