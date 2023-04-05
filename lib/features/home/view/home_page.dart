import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/router/router.dart';
import 'package:pms_manager/utils/styles.dart';

import '../../../utils/colors.dart';
import '../../../utils/widgets/custom_radio_butt.dart';

final propertyTypeProvier = StateProvider<PropertyType>((ref) {
  return PropertyType.building;
});

final unitTypeProvier = StateProvider<UnitType>((ref) {
  return UnitType.duplex;
});

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  var date1 = DateTime.now().toUtc();
  var date2 = DateTime.now().toUtc();
  change(DateTime time) {
    setState(() {
      date1 = time;
    });
  }

  change2(DateTime time) {
    setState(() {
      date2 = time;
    });
  }

  yMD(DateTime time) {
    String formatted = DateFormat('yMd').format(time);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, p1) {
      return Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(
            backgroundColor: gold,
            onPressed: () {
              showDialogForPropertytype(context);
            },
            child: const Icon(
              Icons.add,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        children: [
                          GestureDetector(
                              onTap: () {
                                selectDat(context, DateTime.now(), change);
                              },
                              child:
                                  CardTimeWidget(text: 'From ${yMD(date1)}')),
                          const SizedBox(width: 5.0, height: 0.0),
                          GestureDetector(
                              onTap: () {
                                selectDat(context, DateTime.now(), change2);
                              },
                              child: CardTimeWidget(text: 'To ${yMD(date2)}')),
                        ],
                      ),
                      Row(
                        // Date
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CardDropDownWidget(),
                          const SizedBox(width: 5.0, height: 0.0),
                          GestureDetector(
                              onTap: () {
                                showFilterDialog(context);
                              },
                              child: const MoreWidget()),
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
                          itemCount: 30,
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
                        onTap: () {
                          AutoRouter.of(context).push(PropertiesPageRoute(
                            propertyType: ref.watch(propertyTypeProvier),
                            unitType: ref.watch(unitTypeProvier),
                          ));
                        },
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

selectDat(
    BuildContext context, selectedDate, Function(DateTime time) change) async {
  DateTime? selected = await showDatePicker(
    context: context,
    initialDatePickerMode: DatePickerMode.day,
    fieldLabelText: '''Enter date  mm/dd/yyyy hh:ss''',
    initialEntryMode: DatePickerEntryMode.calendar,
    initialDate: DateTime.now().toUtc(),
    firstDate: DateTime(2015),
    lastDate: DateTime(20150),
  );
  if (selected != null && selected != selectedDate) {
    var dateTime = DateTime(
      selected.year,
      selected.month,
      selected.day,
    );

    change(dateTime.toUtc());
  }
}

showFilterDialog(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FilterFieldsTemplate(
                    widget: FilterTextFields(hint: 'Property Name'),
                  ),
                  const SizedBox(
                    width: 0.0,
                    height: 10.0,
                  ),
                  FilterFieldsTemplate(
                      widget: GeneralDropDown(
                    list: const ['OwnerName', 'Abd', 'Ruaa', 'Hussam'],
                    value: 'OwnerName',
                  )),
                  const SizedBox(
                    width: 0.0,
                    height: 10.0,
                  ),
                  const FilterFieldsTemplate(
                    widget: FilterTextFields(hint: 'Property Status'),
                  ),
                  const SizedBox(
                    width: 0.0,
                    height: 10.0,
                  ),
                  const FilterFieldsTemplate(
                    widget: FilterTextFields(hint: 'Floor'),
                  ),
                  const SizedBox(
                    width: 0.0,
                    height: 10.0,
                  ),
                  const FilterFieldsTemplate(
                    widget: FilterTextFields(hint: 'Type'),
                  ),
                  const SizedBox(
                    width: 0.0,
                    height: 10.0,
                  ),
                  const FilterFieldsTemplate(
                    widget: FilterTextFields(hint: 'Property Address'),
                  ),
                  const SizedBox(
                    width: 0.0,
                    height: 10.0,
                  ),
                  FilterFieldsTemplate(
                      widget: GeneralDropDown(
                    list: const ['TenantName', 'Abd', 'Ruaa', 'Hussam'],
                    value: 'TenantName',
                  )),
                  const SizedBox(
                    width: 0.0,
                    height: 10.0,
                  ),
                  const FilterFieldsTemplate(
                    widget: FilterTextFields(hint: 'BedRooms'),
                  ),
                  const SizedBox(
                    width: 0.0,
                    height: 10.0,
                  ),
                  const FilterFieldsTemplate(
                    widget: FilterTextFields(hint: 'Bathrooms'),
                  ),
                  const SizedBox(
                    width: 0.0,
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomElevatedButton(
                      text: 'ok',
                      onPressed: () {
                        AutoRouter.of(context).pop();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

enum PropertyType { unit, building, compound }

enum UnitType { reguler, duplex }

enum BuildingType { rentTheEntireBuilding, rentByUnit }

enum CompoundType {
  rentTheEntireCompound,
  rentByBuilding,
  rentByUnit,
}

showDialogForPropertytype(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return LayoutBuilder(builder: (context, p1) {
        return const PropertyTypeDialogWidget();
      });
    },
  );
}

class PropertyTypeDialogWidget extends ConsumerStatefulWidget {
  const PropertyTypeDialogWidget({super.key});

  @override
  ConsumerState<PropertyTypeDialogWidget> createState() =>
      _PropertyTypeDialogWidgetState();
}

class _PropertyTypeDialogWidgetState
    extends ConsumerState<PropertyTypeDialogWidget> {
  PropertyType propertyType = PropertyType.unit;
  UnitType unitType = UnitType.duplex;
  BuildingType buildingType = BuildingType.rentTheEntireBuilding;
  CompoundType compoundType = CompoundType.rentTheEntireCompound;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, p1) {
      return Material(
        color: Colors.transparent,
        child: Center(
          child: AnimatedContainer(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            height: PropertyType.unit == propertyType
                ? p1.maxHeight / 1.4
                : PropertyType.building == propertyType
                    ? p1.maxHeight / 1.2
                    : p1.maxHeight / 1.1,
            width: p1.maxWidth / 1.3,
            duration: const Duration(milliseconds: 300),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      AutoRouter.of(context).pop();
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: gold),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'Property Type',
                          style: TextStyle(color: gold, fontSize: 22),
                        ),
                        SizedBox(
                          width: 0.0,
                          height: 20.0,
                        ),
                        Text(
                          'lorem ipsum lorem ipsum lorem ipsumlorem ipsumlorem ipsum lorem ipsumlorem ipsumlorem ipsum',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 0.0, height: 25.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LanguageRadioRow(
                        textColor: lightDark,
                        color: gold,
                        groupValue: propertyType,
                        value: PropertyType.unit,
                        onChanged: (value) {
                          //TODO define routes to go to office
                          setState(() {
                            propertyType = value!;
                          });
                        },
                        text: 'Unit',
                      ),
                      // For Unit SubCategory
                      if (propertyType == PropertyType.unit)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: size.width / 7.8,
                                  ),
                                  const Text('Number of Floors'),
                                ],
                              ),
                              Transform.scale(
                                scale: 0.8,
                                child: LanguageRadioRow(
                                  textColor: lightDark,
                                  color: gold,
                                  groupValue: unitType,
                                  value: UnitType.reguler,
                                  onChanged: (value) {
                                    //TODO define routes to go to office
                                    setState(() {
                                      unitType = value!;
                                    });
                                  },
                                  text: 'Reguler',
                                ),
                              ),
                              Transform.scale(
                                scale: 0.8,
                                child: LanguageRadioRow(
                                  textColor: lightDark,
                                  color: gold,
                                  groupValue: unitType,
                                  value: UnitType.duplex,
                                  onChanged: (value) {
                                    //TODO define routes to go to office
                                    setState(() {
                                      unitType = value!;
                                    });
                                  },
                                  text: 'Duplex',
                                ),
                              ),
                            ],
                          ),
                        ),
                      LanguageRadioRow(
                        textColor: lightDark,
                        color: gold,
                        groupValue: propertyType,
                        value: PropertyType.building,
                        onChanged: (value) {
                          //TODO define routes to go to office
                          setState(() {
                            propertyType = value!;
                          });
                        },
                        text: 'Building',
                      ),
                      // building Sub Category
                      if (propertyType == PropertyType.building)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: LanguageRadioRow(
                                  textColor: lightDark,
                                  color: gold,
                                  groupValue: buildingType,
                                  value: BuildingType.rentTheEntireBuilding,
                                  onChanged: (value) {
                                    //TODO define routes to go to office
                                    setState(() {
                                      buildingType = value!;
                                    });
                                  },
                                  text: 'Rent The entire Building ?',
                                ),
                              ),
                              Transform.scale(
                                scale: 0.8,
                                child: LanguageRadioRow(
                                  textColor: lightDark,
                                  color: gold,
                                  groupValue: buildingType,
                                  value: BuildingType.rentByUnit,
                                  onChanged: (value) {
                                    //TODO define routes to go to office
                                    setState(() {
                                      buildingType = value!;
                                    });
                                  },
                                  text: 'Rent By Unit',
                                ),
                              ),
                              // Sub Sub Category of building
                              if (propertyType == PropertyType.building &&
                                  buildingType == BuildingType.rentByUnit)
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Transform.scale(
                                        scale: 0.65,
                                        child: LanguageRadioRow(
                                          textColor: lightDark,
                                          color: gold,
                                          groupValue: unitType,
                                          value: UnitType.reguler,
                                          onChanged: (value) {
                                            //TODO define routes to go to office
                                            setState(() {
                                              unitType = value!;
                                            });
                                          },
                                          text: 'Reguler',
                                        ),
                                      ),
                                      Transform.scale(
                                        scale: 0.65,
                                        child: LanguageRadioRow(
                                          textColor: lightDark,
                                          color: gold,
                                          groupValue: unitType,
                                          value: UnitType.duplex,
                                          onChanged: (value) {
                                            //TODO define routes to go to office
                                            setState(() {
                                              unitType = value!;
                                            });
                                          },
                                          text: 'Duplex',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      LanguageRadioRow(
                        color: gold,
                        textColor: lightDark,
                        groupValue: propertyType,
                        value: PropertyType.compound,
                        onChanged: (value) {
                          setState(() {
                            propertyType = value!;
                          });
                        },
                        text: 'Compound',
                      ),
                      //Copmound Sub Category
                      if (propertyType == PropertyType.compound)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: LanguageRadioRow(
                                  textColor: lightDark,
                                  color: gold,
                                  groupValue: compoundType,
                                  value: CompoundType.rentTheEntireCompound,
                                  onChanged: (value) {
                                    //TODO define routes to go to office
                                    setState(() {
                                      compoundType = value!;
                                    });
                                  },
                                  text: 'rent The Entire Compound ?',
                                ),
                              ),
                              Transform.scale(
                                scale: 0.8,
                                child: LanguageRadioRow(
                                  textColor: lightDark,
                                  color: gold,
                                  groupValue: compoundType,
                                  value: CompoundType.rentByBuilding,
                                  onChanged: (value) {
                                    //TODO define routes to go to office
                                    setState(() {
                                      compoundType = value!;
                                    });
                                  },
                                  text: 'Rent By Building',
                                ),
                              ),
                              Transform.scale(
                                scale: 0.8,
                                child: LanguageRadioRow(
                                  textColor: lightDark,
                                  color: gold,
                                  groupValue: compoundType,
                                  value: CompoundType.rentByUnit,
                                  onChanged: (value) {
                                    //TODO define routes to go to office
                                    setState(() {
                                      compoundType = value!;
                                    });
                                  },
                                  text: 'Rent By Unit',
                                ),
                              ),
                            ],
                          ),
                        ),
                      //subCategory of compound
                      if (propertyType == PropertyType.compound &&
                          CompoundType.rentByUnit == compoundType)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Transform.scale(
                                scale: 0.65,
                                child: LanguageRadioRow(
                                  textColor: lightDark,
                                  color: gold,
                                  groupValue: unitType,
                                  value: UnitType.reguler,
                                  onChanged: (value) {
                                    //TODO define routes to go to office
                                    setState(() {
                                      unitType = value!;
                                    });
                                  },
                                  text: 'Reguler',
                                ),
                              ),
                              Transform.scale(
                                scale: 0.65,
                                child: LanguageRadioRow(
                                  textColor: lightDark,
                                  color: gold,
                                  groupValue: unitType,
                                  value: UnitType.duplex,
                                  onChanged: (value) {
                                    //TODO define routes to go to office
                                    setState(() {
                                      unitType = value!;
                                    });
                                  },
                                  text: 'Duplex',
                                ),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(width: 0.0, height: 10),
                      CustomElevatedButton(
                        text: 'Select',
                        onPressed: () {
                          //TODO Select (Take the enums inside the page)
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class FilterFieldsTemplate extends StatelessWidget {
  const FilterFieldsTemplate({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: widget,
    );
  }
}

class FilterTextFields extends StatelessWidget {
  const FilterTextFields({super.key, required this.hint});
  final String hint;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        border: InputBorder.none,
      ),
    );
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
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 64,
      width: size.width / 2.46,
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
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 64,
      width: size.width / 2.46,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: GeneralDropDown(
              width: size.width / 3.5,
              list: const ['Property Type', 'Two', 'Free', 'Four'],
              value: value,
            )),
      ),
    );
  }
}

class GeneralDropDown extends StatefulWidget {
  GeneralDropDown(
      {super.key, required this.value, required this.list, this.width});
  String value;
  List<String> list;
  final double? width;
  @override
  State<GeneralDropDown> createState() => _GeneralDropDownState();
}

class _GeneralDropDownState extends State<GeneralDropDown> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DropdownButton(
        value: widget.value,
        alignment: Alignment.bottomCenter,
        icon: Transform.rotate(
            angle: -pi / 2,
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 15,
              color: gold,
            )),
        items: widget.list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: SizedBox(
                width: widget.width ?? size.width / 1.2, child: Text(value)),
          );
        }).toList(),
        onChanged: (object) {
          setState(() {
            widget.value = object ?? '';
          });
        });
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
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 64,
      width: size.width / 2.46,
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
