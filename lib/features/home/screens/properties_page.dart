import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pms_manager/router/router.dart';
import 'package:pms_manager/utils/colors.dart';
import 'package:pms_manager/utils/styles.dart';

class PropertiesPage extends StatefulWidget {
  const PropertiesPage({super.key});

  @override
  State<PropertiesPage> createState() => _PropertiesPageState();
}

class _PropertiesPageState extends State<PropertiesPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              AutoRouter.of(context).replace(const PropertyDetailsRoute());
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: size.height / 3.5,
              padding: const EdgeInsets.all(16),
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
                      Spacer(),
                      Image.asset('assets/png/n.png')
                    ],
                  ),
                  SizedBox(width: 10.0, height: 0.0),
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
                      Text('vacant'),
                      const SizedBox(
                        width: 0.0,
                        height: 15.0,
                      ),
                      const Text('unit'),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/png/n.png',
                            width: size.width / 8,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Image.asset(
                            'assets/png/n.png',
                            width: size.width / 8,
                          ),
                          const SizedBox(
                            width: 8.0,
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
