import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/features/property_details/side_menu/add_attachments.dart';
import 'package:pms_manager/router/router.dart';
import 'package:pms_manager/utils/colors.dart';

class RemindersPage extends StatefulWidget {
  const RemindersPage({Key? key}) : super(key: key);

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {


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
                    Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0,left: 26,),
                              child: Row(
                                children: [
                                  Text('Reminders',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: textGrey,
                                    fontSize: 24,
                                  ),
                                  ),
                                  SizedBox(width: 60,),
                                  Text('Yes',
                                    style: TextStyle(
                                      color: textGrey,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: 18,),
                                  Text('No',
                                style: TextStyle(
                                  color: textGrey,
                                  fontSize: 15,
                                ),
                              ),
                                  SizedBox(width: 22,),
                                  Text('# of Days',
                                    style: TextStyle(
                                      color: textGrey,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0,left: 26,),
                              child: Row(
                                children: [
                                  Text('Contract Payment',
                                    style: TextStyle(
                                      color: textGrey,
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(width: 43,),
                                 Icon(Icons.circle_outlined,
                                 color: gold,),
                                  SizedBox(width: 18,),
                                  Text('No',
                                    style: TextStyle(
                                      color: textGrey,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: 22,),
                                  Text('# of Days',
                                    style: TextStyle(
                                      color: textGrey,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0,left: 26,),
                              child: Row(
                                children: [
                                  Text('Lease Expiry',
                                    style: TextStyle(
                                      color: textGrey,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0,left: 26,),
                              child: Row(
                                children: [
                                  Text('Parking Payment',
                                    style: TextStyle(
                                      color: textGrey,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0,left: 26,),
                              child: Row(
                                children: [
                                  Text('Parking Expiry',
                                    style: TextStyle(
                                      color: textGrey,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0,left: 26,),
                              child: Row(
                                children: [
                                  Text('Common Payment',
                                    style: TextStyle(
                                      color: textGrey,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0,left: 26,),
                              child: Row(
                                children: [
                                  Text('Common Expiry',
                                    style: TextStyle(
                                      color: textGrey,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 40,),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomElevatedButton(
                        width: 295.84,
                        height: 51.45,
                        text: 'Next', onPressed: () { 
                          AutoRouter.of(context).push(const AddAttachmentsPageRoute());
                      },
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}
