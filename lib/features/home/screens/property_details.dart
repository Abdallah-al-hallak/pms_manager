import 'package:flutter/material.dart';
import 'package:pms_manager/utils/styles.dart';
import 'package:pms_manager/utils/widgets/property_details_list_tile.dart';

import '../../../utils/colors.dart';

class PropertyDetails extends StatefulWidget {
  const PropertyDetails({super.key});

  @override
  State<PropertyDetails> createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          Text(
            'Building Name',
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
          //
          const SizedBox(
            width: 0.0,
            height: 20.0,
          ),
          const PropertyDetailsListTile(
            desc:
                'loremipsumloremipsum loremipsum loremipsumloremipsumloremipsumloremipsum ',
            type: '5 Floors',
            image: 'assets/png/tiles.png',
            title: 'Floors',
          ),
          const SizedBox(
            width: 0.0,
            height: 20.0,
          ),
          const PropertyDetailsListTile(
            desc:
                'loremipsumloremipsum loremipsum loremipsumloremipsumloremipsumloremipsum ',
            type: '300 m',
            title: 'Number Of units / Floor',
            image: 'assets/png/area.png',
          ),
          const SizedBox(
            width: 0.0,
            height: 20.0,
          ),
          const PropertyDetailsListTile(
            desc:
                'loremipsumloremipsum loremipsum loremipsumloremipsumloremipsumloremipsum ',
            type: '300 m',
            title: 'Building Size',
            image: 'assets/png/area.png',
          ),
          const SizedBox(
            width: 0.0,
            height: 20.0,
          ),
          const PropertyDetailsListTile(
            desc:
                'loremipsumloremipsum loremipsum loremipsumloremipsumloremipsumloremipsum ',
            type: '',
            title: ' Property Addres',
            image: 'assets/png/loc.png',
            address: 'UnConfirmed',
          ),
        ],
      ),
    ));
  }
}

