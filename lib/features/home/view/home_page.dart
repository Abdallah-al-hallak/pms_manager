import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/utils/styles.dart';

import '../../../utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    CardDropDownWidget()
                  ],
                ),
                const SizedBox(width: 0.0, height: 15.0),
                CustomElevatedButton(text: 'search', onPressed: () {}),
                SizedBox(
                  height: 240,
                  child: Expanded(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                      ),
                      itemCount: 30,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.asset('assets/png/home.png');
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 0.0, height: 13.0),
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
              ],
            ),
          ),
        ],
      ),
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
  dynamic value;
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
                  value = object;
                });
              }),
        ),
      ),
    );
  }
}
