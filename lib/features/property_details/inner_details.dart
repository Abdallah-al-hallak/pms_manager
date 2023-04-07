import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
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
                      child: const Text(
                        'Inner Details',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
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
                                  SizedBox(height: 80,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('First Floor', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                                      SizedBox(height: 20,),
                                      Text('Lorem ipsum dolor sit amet,\nconsectetur adipiscing aaelit, sed do\neiusmod tempor incididunt ut labore et ',
                                          style: TextStyle(fontSize: 14)
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 60),
                                    child: Column(
                                      children: [
                                       Icon(Icons.arrow_forward_ios_outlined,
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
                        SizedBox(height: 12,),
                        Card(
                          child: SizedBox(
                            width: 365.75,
                            height: 120.99,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  SizedBox(height: 80,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Second Floor', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                                      SizedBox(height: 20,),
                                      Text('Lorem ipsum dolor sit amet,\nconsectetur adipiscing aaelit, sed do\neiusmod tempor incididunt ut labore et ',
                                          style: TextStyle(fontSize: 14)
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 60),
                                    child: Column(
                                      children: [
                                        Icon(Icons.arrow_forward_ios_outlined,
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
                        SizedBox(height: 12,),
                        Card(
                          child: SizedBox(
                            width: 365.75,
                            height: 120.99,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  SizedBox(height: 80,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Third Floor', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                                      SizedBox(height: 20,),
                                      Text('Lorem ipsum dolor sit amet,\nconsectetur adipiscing aaelit, sed do\neiusmod tempor incididunt ut labore et ',
                                          style: TextStyle(fontSize: 14)
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 60),
                                    child: Column(
                                      children: [
                                        Icon(Icons.arrow_forward_ios_outlined,
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
                        SizedBox(height: 40,),
                        CustomElevatedButton(
                            width: 295.84,
                            height: 51.45,
                            text: 'Next',
                            onPressed: (){

                            }),
                      ],
                    )
                  ],
                ))),
      ),
    );
  }
}
