import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pms_manager/router/router.dart';
import 'package:pms_manager/utils/colors.dart';

class UnitDetails extends StatefulWidget {
  const UnitDetails({Key? key}) : super(key: key);

  @override
  State<UnitDetails> createState() => _UnitDetailsState();
}

class _UnitDetailsState extends State<UnitDetails> {
  ScrollController _scrollController = ScrollController();
  int currentPos = 0;
  List<String> listPaths = [
    "images/nature1.jpg",
    "images/nature2.jpg",
    "images/nature3.jpg",
    "images/nature4.jpg",
    "images/nature5.jpg",
    "images/nature6.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: LayoutBuilder(
            builder: (context, p1) => SafeArea(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Add Unit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          '(Regular)',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                                autoPlay: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    currentPos = index;
                                  });
                                }),
                            items: [1, 2, 3, 4, 5].map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    child: Image.asset(
                                        'assets/png/unitDetails.png'),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: listPaths.map((url) {
                              int index = listPaths.indexOf(url);
                              return Container(
                                width: 8.0,
                                height: 8.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentPos == index
                                      ? const Color.fromRGBO(0, 0, 0, 0.9)
                                      : const Color.fromRGBO(0, 0, 0, 0.4),
                                ),
                              );
                            }).toList(),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(24.0),
                            child: GridB(),
                          ),
                          Column(
                            children: const [
                              Text(
                                'view More',
                                style: TextStyle(color: gold),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: gold,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ])
                  ],
                ))),
      ),
    );
  }
}

class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "images": "assets/png/item1.png",
      "route": const BaseLeseDetailsRoute(),
    },
    {
      "images": "assets/png/item2.png",
      "route": '',
    },
    {
      "images": "assets/png/item3.png",
      "route": const InnerDetailsRoute(),
    },
    {
      "images": "assets/png/item4.png",
      "route": '',
    },
    {
      "images": "assets/png/item5.png",
      "route": const OwnerDetailsRoute(),
    },
    {
      "images": "assets/png/item6.png",
      "route": const TenantDetailsRoute(),
    },
    {
      "images": "assets/png/item7.png",
      "route": '',
    },
    {
      "images": "assets/png/item8.png",
      "route": const ViolationsViewroute(),
    },
    {
      "images": "assets/png/item9.png",
      "route": '',
    },
    {
      "images": "assets/png/item10.png",
      "route": '',
    },
    {
      "images": "assets/png/item11.png",
      "route": '',
    },
    {
      "images": "assets/png/item12.png",
      "route": '',
    },
    {
      "images": "assets/png/item13.png",
      "route": '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 115,
      ),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  AutoRouter.of(context).push(
                    gridMap.elementAt(index)['route'],
                  );
                },
                child: ClipRRect(
                  child: Image.asset(
                    "${gridMap.elementAt(index)['images']}",
                    height: 114,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
