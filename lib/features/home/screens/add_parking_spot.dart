import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pms_manager/features/home/screens/lease_details.dart';
import 'package:pms_manager/features/home/view/home_page.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/router/router.dart';
import 'package:pms_manager/utils/colors.dart';
import 'package:pms_manager/utils/helper/theme_helper.dart';

class AddParkingSpot extends StatefulWidget {
  const AddParkingSpot({Key? key}) : super(key: key);

  @override
  State<AddParkingSpot> createState() => _AddParkingSpotState();
}

class _AddParkingSpotState extends State<AddParkingSpot> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
            builder: (context, p1) => SafeArea(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 23,
                    ),
                    const Center(
                      child: Text(
                        'Add Parking Spot',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Container(
                            decoration: ThemeHelper().inputBoxDecorationShadow(),
                            child: TextField(
                              decoration: ThemeHelper().textInputDecoration('Property Name', '',
                                const RotatedBox(
                                  quarterTurns: 1,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: gold,
                                      size: 18,
                                    ),
                                    onPressed: null,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 27.6,
                          ),
                          Row(
                            children: [
                              const SizedBox(height: 30.0),
                              Flexible(
                                child:Container(
                                  decoration: ThemeHelper().inputBoxDecorationShadow(),
                                  child: TextField(
                                    decoration: ThemeHelper().textInputDecoration('Level', '',
                                      const RotatedBox(
                                        quarterTurns: 1,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: gold,
                                            size: 18,
                                          ),
                                          onPressed: null,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12.4),
                              Flexible(
                                child:Container(
                                  decoration: ThemeHelper().inputBoxDecorationShadow(),
                                  child: TextField(
                                    decoration: ThemeHelper().textInputDecoration('Number', '',),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 27.6,
                          ),
                          Container(
                            decoration: ThemeHelper().inputBoxDecorationShadow(),
                            child: TextField(
                              decoration: ThemeHelper().textInputDecoration('Size', '',
                                const RotatedBox(
                                  quarterTurns: 1,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: gold,
                                      size: 18,
                                    ),
                                    onPressed: null,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 27.6,
                          ),
                          Container(
                            decoration: ThemeHelper().inputBoxDecorationShadow(),
                            child: TextField(
                              decoration: ThemeHelper().textInputDecoration('Amount Per Month', '',
                                const RotatedBox(
                                  quarterTurns: 1,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: gold,
                                      size: 18,
                                    ),
                                    onPressed: null,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 27.6,
                          ),
                          LeaseFieldsTemplate(
                              height: size.width / 2,
                              widget: const FilterTextFields(
                                hint: 'Notes',
                              )),
                          const SizedBox(
                            height: 27.6,
                          ),
                          CustomElevatedButton(
                              width: 295.84,
                              height: 51.45,
                              text: 'Add',
                              onPressed: (){
                                AutoRouter.of(context).push(const CommonAreasPageRoute());
                              }),
                          const SizedBox(
                            height: 27.6,
                          ),
                        ],
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}
