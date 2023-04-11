import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:pms_manager/features/home/screens/lease_details.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/router/router.dart';
import 'package:pms_manager/utils/colors.dart';

class RemindersPage extends StatefulWidget {
  const RemindersPage({Key? key}) : super(key: key);

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  var date1 = DateTime.now().toUtc();
  yMD(DateTime time) {
    String formatted = DateFormat('yMd').format(time);
    return formatted;
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: LayoutBuilder(
            builder: (context, p1) => Column(
              children: [
                LeaseFieldsTemplate(
                  height: 44,
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Contract Payment Date',
                            style: TextStyle(
                              fontSize: 14,
                              color: textGrey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Text('${yMD(date1)}',
                              style: TextStyle(
                                fontSize: 14,
                                color: textGrey,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                LeaseFieldsTemplate(
                  height: 44,
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Parking Payment Date',
                            style: TextStyle(
                              fontSize: 14,
                              color: textGrey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 55.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('${yMD(date1)}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: textGrey,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                LeaseFieldsTemplate(
                  height: 44,
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Common Payment Date',
                            style: TextStyle(
                              fontSize: 14,
                              color: textGrey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 47.0),
                            child: Text('${yMD(date1)}',
                              style: TextStyle(
                                fontSize: 14,
                                color: textGrey,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text('Reminders',
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               color: textGrey,
                               fontSize: 20,
                             ),
                           ),
                          SizedBox(height: 15,),
                          Text('Contract Payment',
                            style: TextStyle(
                              color: textGrey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text('Lease Expiry',
                            style: TextStyle(
                              color: textGrey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text('Parking Payment',
                            style: TextStyle(
                              color: textGrey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text('Parking Expiry',
                            style: TextStyle(
                              color: textGrey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text('Common Payment',
                            style: TextStyle(
                              color: textGrey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text('Common Expiry',
                            style: TextStyle(
                              color: textGrey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: const [
                            Text('Yes',
                              style: TextStyle(
                                color: textGrey,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 12.4,),
                            Icon(Icons.circle_outlined,
                              color: gold,),
                            SizedBox(height: 8.0,),
                            Icon(Icons.circle_outlined,
                              color: gold,),
                            SizedBox(height: 8.0,),
                            Icon(Icons.circle_outlined,
                              color: gold,),
                            SizedBox(height: 8.0,),
                            Icon(Icons.circle_outlined,
                              color: gold,),
                            SizedBox(height: 8.0,),
                            Icon(Icons.circle_outlined,
                              color: gold,),
                            SizedBox(height: 8.0,),
                            Icon(Icons.circle_outlined,
                              color: gold,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: const [
                            Text('No',
                              style: TextStyle(
                                color: textGrey,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 12.4,),
                            Icon(Icons.circle_outlined,
                              color: gold,),
                            SizedBox(height: 8.0,),
                            Icon(Icons.circle_outlined,
                              color: gold,),
                            SizedBox(height: 8.0,),
                            Icon(Icons.circle_outlined,
                              color: gold,),
                            SizedBox(height: 8.0,),
                            Icon(Icons.circle_outlined,
                              color: gold,),
                            SizedBox(height: 8.0,),
                            Icon(Icons.circle_outlined,
                              color: gold,),
                            SizedBox(height: 8.0,),
                            Icon(Icons.circle_outlined,
                              color: gold,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: const [
                            Text('# of Days',
                              style: TextStyle(
                                color: textGrey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19.0),
                    ),
                    child: Container(
                      height: 180.01,
                      width: 299.89,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 19.2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 21.0, top: 7),
                            child: Row(
                              children: [
                                Text('Reminder Tilte',
                                  style: TextStyle(
                                    color: textGrey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12.2,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomElevatedButton(
                                width: 100,
                                height: 36,
                                text: 'Done',
                                onPressed: () {},
                              ),
                              SizedBox(width: 18,),
                              CustomElevatedButton(
                                width: 100,
                                height: 36,
                                text: 'Time',
                                onPressed: () {},
                              ),
                            ],
                          ),
                          SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomElevatedButton(
                                width: 218,
                                height: 36,
                                text: 'Add Reminder',
                                onPressed: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20,),
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
            )),
      );
  }
}
