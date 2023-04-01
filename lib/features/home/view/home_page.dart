import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/utils/styles.dart';

import '../../../utils/colors.dart';

import '../../../utils/colors.dart';
import '../../intro/widgets/custom_buton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, p1) {
      return Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(
            backgroundColor: gold,
            onPressed: () {},
            child: const Icon(
              Icons.add,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(width: 0.0, height: 13.0),
                Row(
                  // title
                  children: [
                    Image.asset('assets/png/triangle.png'),
                    const SizedBox(width: 15.0, height: 0.0),
                    Text(
                      'Available Properties',
                      style: titleTextStyle(),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      Row(
                        // Date
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CardTimeWidget(text: 'From'),
                          SizedBox(width: 5.0, height: 0.0),
                          CardTimeWidget(text: 'To'),
                        ],
                      ),
                      Row(
                        // Date
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CardDropDownWidget(),
                          SizedBox(width: 5.0, height: 0.0),
                          MoreWidget(),
                        ],
                      ),
                      const SizedBox(width: 0.0, height: 15.0),
                      CustomElevatedButton(text: 'search', onPressed: () {}),
                      const SizedBox(width: 0.0, height: 15.0),
                      Container(
                        height: 100,
                        constraints: BoxConstraints(
                          minHeight: p1.maxHeight / 1.9,
                        ),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                          ),
                          itemCount: 50,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Image.asset(
                                  'assets/png/home1.png',
                                  color:
                                      index.isEven ? Colors.red : Colors.green,
                                ),
                                const Text('MM/YY')
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 0.0, height: 15.0),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          // properies
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'View All properties',
                              style: TextStyle(color: gold),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15,
                              color: gold,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 0.0, height: 13.0),
                    ],
                  ),
                ),
                Row(
                  // title
                  children: [
                    Image.asset('assets/png/triangle.png'),
                    const SizedBox(width: 15.0, height: 0.0),
                    Text(
                      'Other',
                      style: titleTextStyle(),
                    )
                  ],
                ),
                const Padding(

                  padding: EdgeInsets.symmetric(horizontal: 28),
                  child: OtherListTileWidget(
                    title: 'SubManagers',
                    subtitle: 'loremipsumloremipsumloremipsumloremIpsum',
                  ),
                ),
                const SizedBox(
                  width: 0.0,
                  height: 20.0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  child: OtherListTileWidget(
                    title: 'SubManagers',
                    subtitle:
                        'loremipsumloremipsumloremipsumloremIpsqr44gfergergergergregum',
                  ),
                ),
              ],
            ),
          ));
    });
  }
}

class OtherListTileWidget extends StatelessWidget {
  const OtherListTileWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 130,
          width: 130,
          color: gold,
          child: Image.asset(
            'assets/png/users.png',
          ),
        ),
        const SizedBox(
          width: 10.0,
          height: 0.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: titleTextStyle(),
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 200),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ],
    );
  }
}

class CardTimeWidget extends StatefulWidget {
  const CardTimeWidget({super.key, required this.text});
  final String text;
  @override
  State<CardTimeWidget> createState() => _CardTimeWidgetState();
}

class _CardTimeWidgetState extends State<CardTimeWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 170,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.text),
              const Icon(
                Icons.date_range,
                color: gold,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardDropDownWidget extends StatefulWidget {
  const CardDropDownWidget({super.key});

  @override
  State<CardDropDownWidget> createState() => _CardDropDownWidgetState();
}

class _CardDropDownWidgetState extends State<CardDropDownWidget> {
  String value = 'Property Type';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 170,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: DropdownButton(
              value: value,
              alignment: Alignment.bottomCenter,
              icon: Transform.rotate(
                  angle: -pi / 2,
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 15,
                    color: gold,
                  )),
              items: <String>['Property Type', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (object) {
                setState(() {
                  value = object ?? '';
                });
              }),
        ),
      ),
    );
  }
}

class MoreWidget extends StatefulWidget {
  const MoreWidget({super.key});

  @override
  State<MoreWidget> createState() => _MoreWidgetState();
}

class _MoreWidgetState extends State<MoreWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 170,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Center(
            child: Text(
              'More',
            ),
          ),
        ),
      ),
    );
  }
}
