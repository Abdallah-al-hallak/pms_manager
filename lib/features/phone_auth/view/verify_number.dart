import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/features/intro/widgets/my_textfield.dart';


class VerifyNumber extends StatelessWidget {
  VerifyNumber({super.key});

  // text editing controllers
  final phoneNumberController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: LayoutBuilder (
            builder: (context, p1)=>
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 25),

                          // logo
                          Image.asset(
                            "assets/png/logo.png",
                            fit: BoxFit.contain,
                          ),

                          const SizedBox(height: 15),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text(
                              'Please, enter the verification code we sent to your Phone Number',
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                              ),
                              // style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: TextField(
                                    style: Theme.of(context).textTheme.headline6,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: TextField(
                                    style: Theme.of(context).textTheme.headline6,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: TextField(
                                    style: Theme.of(context).textTheme.headline6,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: TextField(
                                    style: Theme.of(context).textTheme.headline6,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 25),

                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: CustomElevatedButton(
                              onPressed: () {  },
                              text: 'Verify Phone',
                              height: 50,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
        ),
      ),
    );
  }
}
