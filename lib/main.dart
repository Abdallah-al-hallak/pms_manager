import 'package:flutter/material.dart';
import 'package:pms_manager/features/intro/view/login_page.dart';
import 'package:pms_manager/utils/colors.dart';
import 'package:pms_manager/utils/widgets/custom_radio_butt.dart';
import 'package:auto_route/auto_route.dart';
import 'features/intro/view/page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routerConfig: _appRouter.config(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

enum Languages { arabic, english }

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var language = Languages.english;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutBuilder(
      builder: (p0, p1) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/png/lang.png'),
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
                          onChanged: (value) async {
                            //TODO Engilsh logic language
                            setState(() {
                              language = value!;
                            });
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PageViewIntro(),
                                ));
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
                                  builder: (context) => const PageViewIntro(),
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
