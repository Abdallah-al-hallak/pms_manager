import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/router/router.dart';
import 'package:pms_manager/utils/colors.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  // text editing controllers
  final phoneNumberController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
            builder: (context, p1) => SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 50),

                          // logo
                          Image.asset(
                            "assets/png/logo.png",
                            fit: BoxFit.contain,
                          ),

                          const SizedBox(height: 50),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: IntlPhoneField(
                              cursorColor: gold,
                              decoration: const InputDecoration(
                                labelText: 'Phone Number',
                                fillColor: gold,
                                iconColor: gold,
                                prefixIconColor: Colors.black,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: gold),
                                ),
                              ),
                              initialCountryCode: 'JO',
                              onChanged: (phone) {
                                print(phone.completeNumber);
                              },
                            ),
                          ),

                          const SizedBox(height: 90),

                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: CustomElevatedButton(
                              onPressed: () {
                                AutoRouter.of(context)
                                    .push(VerifyNumberRoute());
                              },
                              text: 'Send Code',
                              height: 50,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}
