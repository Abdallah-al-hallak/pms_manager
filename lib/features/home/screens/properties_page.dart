import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pms_manager/features/home/view/home_page.dart';
import 'package:pms_manager/router/router.dart';
import 'package:pms_manager/utils/colors.dart';
import 'package:pms_manager/utils/styles.dart';

class PropertiesPage extends StatefulWidget {
  const PropertiesPage(
      {super.key, required this.propertyType, required this.unitType});
  final PropertyType propertyType;
  final UnitType unitType;
  @override
  State<PropertiesPage> createState() => _PropertiesPageState();
}

class _PropertiesPageState extends State<PropertiesPage> {
  List<PropertyType> propertyTypeList = [
    PropertyType.building,
    PropertyType.compound,
    PropertyType.unit,
    PropertyType.unit
  ];
  List<UnitType> unitTypeList = [
    UnitType.duplex,
    UnitType.duplex,
    UnitType.duplex,
    UnitType.regular,
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              AutoRouter.of(context).replace(PropertyDetailsRoute(
                  propertyType: propertyTypeList[index],
                  unitType: unitTypeList[index]));
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: size.height / 3.5,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: grey1Card,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Property Name',
                        style: titleTextStyle(),
                      ),
                      const Spacer(),
                      Image.asset('assets/png/n.png')
                    ],
                  ),
                  const SizedBox(width: 10.0, height: 0.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Available',
                        style: TextStyle(color: Colors.green),
                      ),
                      const SizedBox(
                        width: 0.0,
                        height: 15.0,
                      ),
                      const Text('vacant'),
                      const SizedBox(
                        width: 0.0,
                        height: 15.0,
                      ),
                      Text(propertyTypeList[index].name),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/png/n.png',
                            width: size.width / 8,
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Image.asset(
                            'assets/png/n.png',
                            width: size.width / 8,
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Image.asset(
                            'assets/png/n.png',
                            width: size.width / 8,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
