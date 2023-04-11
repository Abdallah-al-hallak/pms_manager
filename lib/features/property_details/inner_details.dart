import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/router/router.dart';
import 'package:pms_manager/utils/colors.dart';

class InnerDetails extends StatefulWidget {
  const InnerDetails({Key? key}) : super(key: key);

  @override
  State<InnerDetails> createState() => _InnerDetailsState();
}

class _InnerDetailsState extends State<InnerDetails> {
  @override
  Widget build(BuildContext context) {
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
                        'Inner Details',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Column(
                      children: [
                        Card(
                          child: SizedBox(
                            width: 365.75,
                            height: 120.99,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  const SizedBox(height: 80,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('First Floor', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                                      const SizedBox(height: 20,),
                                      const Text('Lorem ipsum dolor sit amet,\nconsectetur adipiscing aaelit, sed do\neiusmod tempor incididunt ut labore et ',
                                          style: TextStyle(fontSize: 14)
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 60),
                                    child: Column(
                                      children: [
                                       const Icon(Icons.arrow_forward_ios_outlined,
                                       color: gold,
                                       )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12,),
                        Card(
                          child: SizedBox(
                            width: 365.75,
                            height: 120.99,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  const SizedBox(height: 80,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('Second Floor', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                                      const SizedBox(height: 20,),
                                      const Text('Lorem ipsum dolor sit amet,\nconsectetur adipiscing aaelit, sed do\neiusmod tempor incididunt ut labore et ',
                                          style: TextStyle(fontSize: 14)
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 60),
                                    child: Column(
                                      children: [
                                        const Icon(Icons.arrow_forward_ios_outlined,
                                          color: gold,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12,),
                        Card(
                          child: SizedBox(
                            width: 365.75,
                            height: 120.99,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  const SizedBox(height: 80,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('Third Floor', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                                      const SizedBox(height: 20,),
                                      const Text('Lorem ipsum dolor sit amet,\nconsectetur adipiscing aaelit, sed do\neiusmod tempor incididunt ut labore et ',
                                          style: TextStyle(fontSize: 14)
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 60),
                                    child: Column(
                                      children: [
                                        const Icon(Icons.arrow_forward_ios_outlined,
                                          color: gold,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40,),
                        CustomElevatedButton(
                            width: 295.84,
                            height: 51.45,
                            text: 'Next',
                            onPressed: (){
                              AutoRouter.of(context).push(FirstFloorPageRoute());
                            }),
                      ],
                    )
                  ],
                ))),
      ),
    );
  }
}
