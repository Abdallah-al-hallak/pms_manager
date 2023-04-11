import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pms_manager/features/intro/widgets/custom_text.dart';
import 'package:pms_manager/router/router.dart';
import 'package:pms_manager/utils/colors.dart';
import 'package:pms_manager/utils/styles.dart';
import 'package:pms_manager/utils/widgets/custom_radio_butt.dart';

void main() async {
  await Future.delayed(const Duration(seconds: 2));
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
    return ProviderScope(
      child: MaterialApp.router(
        useInheritedMediaQuery: true,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser:
            _appRouter.defaultRouteParser(includePrefixMatches: false),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const MyHomePage(),
      ),
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
  bool isExpanded1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (p0, p1) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/png/lang.png'),
                SizedBox(
                  width: p1.maxWidth / 1.4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: ExpansionPanelList.radio(
                      elevation: 0,
                      children: [
                        ExpansionPanelRadio(
                            canTapOnHeader: true,
                            backgroundColor: Colors.white,
                            value: 1,
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return const Center(
                                  child: Text(
                                'Select Your Language',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Helvetica',
                                ),
                              ));
                            },
                            body: SizedBox(
                              height: p1.maxHeight / 4.7,
                              width: double.infinity,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                width: double.infinity,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: gold,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // GestureDetector(
                                    //     onTap: () async {
                                    //       await Future.delayed(
                                    //           const Duration(milliseconds: 500));
                                    //       AutoRouter.of(context)
                                    //           .replace(const PageViewRoute());
                                    //     },
                                    //     child: const CustomText(
                                    //         size: 20,
                                    //         text: 'English',
                                    //         color: Colors.white)),
                                    // const SizedBox(width: 0.0, height: 30.0),
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: LanguageRadioRow(
                                        textAlign: TextAlign.end,
                                        width: 100,
                                        groupValue: language,
                                        value: Languages.english,
                                        onChanged: (value) async {
                                          //TODO Engilsh logic language
                                          setState(() {
                                            language = value!;
                                          });
                                          await Future.delayed(const Duration(
                                              milliseconds: 500));
                                          AutoRouter.of(context)
                                              .replace(const PageViewRoute());
                                        },
                                        text: 'English',
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    // GestureDetector(
                                    //     onTap: () async {
                                    //       await Future.delayed(
                                    //           const Duration(milliseconds: 500));
                                    //       AutoRouter.of(context)
                                    //           .push(const PageViewRoute());
                                    //     },
                                    //     child: const CustomText(
                                    //         size: 20,
                                    //         text: 'Arabic',
                                    //         color: Colors.white)),
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: LanguageRadioRow(
                                        textAlign: TextAlign.end,
                                        width: 200,
                                        groupValue: language,
                                        value: Languages.arabic,
                                        onChanged: (value) async {
                                          //TODO Arabic logic language
                                          setState(() {
                                            language = value!;
                                          });
                                          await Future.delayed(const Duration(
                                              milliseconds: 500));
                                          AutoRouter.of(context)
                                              .replace(const PageViewRoute());
                                        },
                                        text: 'عربي',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                // ExpansionTile(
                //   backgroundColor: Colors.transparent,
                //   iconColor: lightDark,
                //   textColor: lightDark,
                //   childrenPadding: const EdgeInsets.all(30),
                //   tilePadding: const EdgeInsets.symmetric(
                //     horizontal: 75,
                //   ),
                //   title: const Text('Select Your Language'),
                //   children: [
                //     SizedBox(
                //       height: p1.maxHeight / 4,
                //       width: p1.maxWidth / 1.5,
                //       child: Container(
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(12),
                //           color: gold,
                //         ),
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             GestureDetector(
                //                 onTap: () async {
                //                   await Future.delayed(
                //                       const Duration(milliseconds: 500));
                //                   AutoRouter.of(context)
                //                       .replace(const PageViewRoute());
                //                 },
                //                 child: const CustomText(
                //                     size: 20,
                //                     text: 'English',
                //                     color: Colors.white)),
                //             const SizedBox(width: 0.0, height: 30.0),
                //             // LanguageRadioRow(
                //             //   groupValue: language,
                //             //   value: Languages.english,
                //             //   onChanged: (value) async {
                //             //     //TODO Engilsh logic language
                //             //     setState(() {
                //             //       language = value!;
                //             //     });
                //             //     await Future.delayed(
                //             //         const Duration(milliseconds: 500));
                //             //     AutoRouter.of(context)
                //             //         .replace(const PageViewRoute());
                //             //   },
                //             //   text: 'English',
                //             // ),
                //             GestureDetector(
                //                 onTap: () async {
                //                   await Future.delayed(
                //                       const Duration(milliseconds: 500));
                //                   AutoRouter.of(context)
                //                       .replace(const PageViewRoute());
                //                 },
                //                 child: const CustomText(
                //                     size: 20,
                //                     text: 'Arabic',
                //                     color: Colors.white)),
                //             // LanguageRadioRow(
                //             //   groupValue: language,
                //             //   value: Languages.arabic,
                //             //   onChanged: (value) async {
                //             //     //TODO Arabic logic language
                //             //     setState(() {
                //             //       language = value!;
                //             //     });
                //             //     await Future.delayed(
                //             //         const Duration(milliseconds: 500));
                //             //     AutoRouter.of(context)
                //             //         .replace(const PageViewRoute());
                //             //   },
                //             //   text: 'Arabic',
                //             // ),
                //           ],
                //         ),
                //       ),
                //     )
                //   ],
                // ),
              ],
            ),
          ),
        ));
  }
}
