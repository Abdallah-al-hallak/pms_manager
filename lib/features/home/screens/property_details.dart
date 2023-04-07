import 'package:flutter/material.dart';
import 'package:pms_manager/features/home/view/home_page.dart';
import 'package:pms_manager/utils/styles.dart';
import 'package:pms_manager/utils/widgets/property_details_list_tile.dart';

import '../../../utils/colors.dart';

class PropertyDetails extends StatefulWidget {
  const PropertyDetails({
    super.key,
    required this.propertyType,
    required this.unitType,
  });
  final PropertyType propertyType;
  final UnitType unitType;
  @override
  State<PropertyDetails> createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Text(
              '${widget.propertyType.name} Name',
              style: titleTextStyle(),
            ),
            const SizedBox(
              width: 0.0,
              height: 10.0,
            ),
            Stack(
              children: [
                Image.asset(
                  'assets/png/m.png',
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset('assets/png/edit.png'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 0.0,
              height: 10.0,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/png/v.png',
                ),
                const SizedBox(width: 5.0, height: 0.0),
                Image.asset(
                  'assets/png/v.png',
                ),
                const SizedBox(width: 5.0, height: 0.0),
                Image.asset(
                  'assets/png/v.png',
                ),
              ],
            ),
            const SizedBox(
              width: 0.0,
              height: 10.0,
            ),
            Row(
              children: [
                const Text('Category'),
                SizedBox(width: size.width / 8, height: 0.0),
                const Text('Status'),
                SizedBox(width: size.width / 8, height: 0.0),
                const Text('Type'),
                const Spacer(),
                const Text(
                  'View More',
                  style: TextStyle(color: gold, fontSize: 16),
                ),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 15,
                  color: gold,
                ),
              ],
            ),
            //unit
            if (widget.propertyType == PropertyType.unit)
              const SizedBox(
                height: 40,
              ),
            if (widget.propertyType == PropertyType.unit)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                width: size.width / 3.6,
                                height: size.width / 3.6,
                                color: gold,
                                child: Image.asset('assets/png/Path.png'),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                '3 Bathrooms',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                width: size.width / 3.6,
                                height: size.width / 3.6,
                                color: gold,
                                child: Image.asset('assets/png/bedd.png'),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                '3 bedRooms',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                width: size.width / 3.6,
                                height: size.width / 3.6,
                                color: gold,
                                child: Image.asset('assets/png/area.png'),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                '700 m',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 0.0, height: 40.0),
                      Row(
                        children: [
                          Image.asset('assets/png/loc.png'),
                          const SizedBox(width: 20.0, height: 0.0),
                          const Text(
                            'Propert Addres',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            // building
            if (widget.propertyType == PropertyType.building)
              Column(
                children: const [
                  SizedBox(
                    width: 0.0,
                    height: 20.0,
                  ),
                  PropertyDetailsListTile(
                    desc:
                        'loremipsumloremipsum loremipsum loremipsumloremipsumloremipsumloremipsum ',
                    type: '5 Floors',
                    image: 'assets/png/tiles.png',
                    title: 'Floors',
                  ),
                  SizedBox(
                    width: 0.0,
                    height: 20.0,
                  ),
                  PropertyDetailsListTile(
                    desc:
                        'loremipsumloremipsum loremipsum loremipsumloremipsumloremipsumloremipsum ',
                    type: '300 m',
                    title: 'Number Of units / Floor',
                    image: 'assets/png/area.png',
                  ),
                  SizedBox(
                    width: 0.0,
                    height: 20.0,
                  ),
                  PropertyDetailsListTile(
                    desc:
                        'loremipsumloremipsum loremipsum loremipsumloremipsumloremipsumloremipsum ',
                    type: '300 m',
                    title: 'Building Size',
                    image: 'assets/png/area.png',
                  ),
                  SizedBox(
                    width: 0.0,
                    height: 20.0,
                  ),
                  PropertyDetailsListTile(
                    desc:
                        'loremipsumloremipsum loremipsum loremipsumloremipsumloremipsumloremipsum ',
                    type: '',
                    title: ' Property Addres',
                    image: 'assets/png/loc.png',
                    address: 'UnConfirmed',
                  ),
                ],
              ),
            // compound
            if (widget.propertyType == PropertyType.compound)
              Column(
                children: const [
                  SizedBox(
                    width: 0.0,
                    height: 20.0,
                  ),
                  PropertyDetailsListTile(
                    title: 'Unit',
                    type: '4 Units',
                    desc:
                        'loremipsumloremipsum loremipsum loremipsumloremipsumloremipsumloremipsum ',
                    image: 'assets/png/unit.png',
                  ),
                  SizedBox(
                    width: 0.0,
                    height: 20.0,
                  ),
                  PropertyDetailsListTile(
                    title: 'Buildings',
                    type: '8 Buildings',
                    desc:
                        'loremipsumloremipsum loremipsum loremipsumloremipsumloremipsumloremipsum ',
                    image: 'assets/png/burj.png',
                  ),
                  SizedBox(
                    width: 0.0,
                    height: 20.0,
                  ),
                  PropertyDetailsListTile(
                    title: 'Compound Size',
                    type: '700 m',
                    desc:
                        'loremipsumloremipsum loremipsum loremipsumloremipsumloremipsumloremipsum ',
                    image: 'assets/png/area.png',
                  ),
                  SizedBox(
                    width: 0.0,
                    height: 20.0,
                  ),
                  PropertyDetailsListTile(
                    title: ' Property Addres',
                    type: '',
                    desc:
                        'loremipsumloremipsum loremipsum loremipsumloremipsumloremipsumloremipsum ',
                    image: 'assets/png/loc.png',
                    address: 'UnConfirmed',
                  ),
                ],
              ),
            const SizedBox(width: 0.0, height: 20.0),
            Image.asset(
              'assets/png/mask.png',
              width: double.infinity,
            )
          ],
        ),
      )),
    );
  }
}
