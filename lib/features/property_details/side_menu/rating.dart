import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
                      height: 83,
                    ),
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
                                child: Card(
                                  elevation: 5,
                                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(19.0),
                                  ),
                                  child: Container(
                                    height: 132.99,
                                    width: 257,
                                    child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          TextField(
                                            decoration: InputDecoration(labelText: 'Notes'),
                                            keyboardType: TextInputType.multiline,
                                            minLines: 1, // <-- SEE HERE
                                            maxLines: 5,
                                            cursorColor: gold,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
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
                ))),
      ),
    );
  }
}
