import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/utils/colors.dart';
import 'package:pms_manager/utils/styles.dart';

class FirstFloorPage extends StatefulWidget {
  const FirstFloorPage({Key? key}) : super(key: key);

  @override
  State<FirstFloorPage> createState() => _FirstFloorPageState();
}

class _FirstFloorPageState extends State<FirstFloorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
            builder: (context, p1) => SafeArea(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.filter_alt,
                          color: gold,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Image.asset('assets/png/SearchBar.png'),
                      ],
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                     Center(
                      child: Text(
                        'First Floor',
                        style: titleTextStyle(),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      // title
                      children: [
                        Container(
                            height: 50,
                            child: Image.asset('assets/png/triangle.png')),
                        const SizedBox(width: 15.0, height: 0.0),
                        Text(
                          'Apartment Number',
                          style: titleTextStyle(),
                        ),
                        const SizedBox(width: 58.0, height: 0.0),
                        Icon(Icons.edit_note,
                        color: gold,
                          size: 30,
                        ),
                        const SizedBox(width: 10.5, height: 0.0),
                        Icon(Icons.delete_forever,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('assets/png/unitDetails.png',
                          height: 109.31, width: 165.81,
                          ),
                        ],
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
