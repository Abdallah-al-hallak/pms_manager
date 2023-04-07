import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pms_manager/features/home/screens/lease_details.dart';
import 'package:pms_manager/features/home/view/home_page.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/utils/colors.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: LayoutBuilder(
            builder: (context, p1) => Column(
                  children: [
            CustomElevatedButton(
              width: 295.84,
              height: 51.45,
              text: 'Renew',
              onPressed: () {},
            ),
            const SizedBox(
              height: 18.5,
            ),
            CustomElevatedButton(
              width: 295.84,
              height: 51.45,
              text: 'End Lease',
              onPressed: () {},
            ),
            const SizedBox(
              height: 18.5,
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
                  height: 333.8,
                  width: 299.89,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 19.2,
                      ),
                      Text('Write Review',
                        style: TextStyle(
                          color: textGrey,
                        ),
                      ),
                      SizedBox(
                        height: 19.2,
                      ),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: gold,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:  LeaseFieldsTemplate(
                            height: size.width / 3,
                            widget: const FilterTextFields(
                              hint: 'Notes',
                            )),
                      ),
                      CustomElevatedButton(
                        width: 215.84,
                        height: 51.45,
                        text: 'Submit',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
                  ],
                )),
      );
  }
}
