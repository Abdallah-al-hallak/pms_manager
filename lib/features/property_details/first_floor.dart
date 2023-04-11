import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pms_manager/utils/colors.dart';
import 'package:pms_manager/utils/styles.dart';
import 'package:pms_manager/utils/widgets/property_details_list_tile.dart';

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
                        SizedBox(
                            height: 50,
                            child: Image.asset('assets/png/triangle.png')),
                        const SizedBox(width: 15.0, height: 0.0),
                        Text(
                          'Apartment Number',
                          style: titleTextStyle(),
                        ),
                        const SizedBox(width: 58.0, height: 0.0),
                        const Icon(Icons.edit_note,
                        color: gold,
                          size: 30,
                        ),
                        const SizedBox(width: 10.5, height: 0.0),
                        const Icon(Icons.delete_forever,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/png/firstFloor.png',
                              height: 109.31, width: 165.81,
                              ),
                            ],
                          ),
                          const SizedBox(width: 9.2, height: 0.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text('Lorem ipsum dolor sit amet,\nconsectetur adipiscing aaelit,\nsed do eiusmod tempor\nincididunt ut labore et',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 52.29,
                                      height: 44.56,
                                      child: Image.asset('assets/png/floor1.png')),
                                  const SizedBox(width: 7,),
                                  SizedBox(
                                      width: 52.29,
                                      height: 44.56,
                                      child: Image.asset('assets/png/floor2.png')),
                                  const SizedBox(width: 7,),
                                  SizedBox(
                                      width: 52.29,
                                      height: 44.56,
                                      child: Image.asset('assets/png/floor3.png')),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 21.7,),
                    const Padding(
                      padding: EdgeInsets.only(left: 30.0,top: 15),
                      child: PropertyDetailsListTile(
                        desc:
                        'loremipsumloremipsum loremipsum loremipsumloremipsumloremipsumloremipsum ',
                        type: '3 Bathrooms',
                        title: 'Bathrooms',
                        image: 'assets/png/bathrooms.png',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 30.0,top: 15),
                      child: PropertyDetailsListTile(
                        desc:
                        'loremipsumloremipsum loremipsum loremipsumloremipsumloremipsumloremipsum ',
                        type: '2 Bedrooms',
                        title: 'Bedrooms',
                        image: 'assets/png/bedrooms.png',
                      ),
                    ),
                    // SizedBox(height: 10.7,),
                    const Padding(
                      padding: EdgeInsets.only(left: 30.0,top: 15),
                      child: PropertyDetailsListTile(
                        desc:
                        'loremipsumloremipsum loremipsum loremipsumloremipsumloremipsumloremipsum ',
                        type: '700m',
                        title: 'Space',
                        image: 'assets/png/space.png',
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
