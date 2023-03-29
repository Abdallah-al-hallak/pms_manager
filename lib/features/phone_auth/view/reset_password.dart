import 'package:flutter/material.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/features/intro/widgets/my_textfield.dart';
import 'package:pms_manager/features/phone_auth/view/verify_number.dart';


class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

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
                          const SizedBox(height: 50),

                          // logo
                          Image.asset(
                            "assets/png/logo.png",
                            fit: BoxFit.contain,
                          ),

                          const SizedBox(height: 50),

                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: MyTextField(
                              controller: phoneNumberController,
                              hintText: 'New Password',
                              obscureText: false,
                            ),
                          ),

                          const SizedBox(height: 25),

                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: MyTextField(
                              controller: phoneNumberController,
                              hintText: 'Confirm New Password',
                              obscureText: false,
                            ),
                          ),

                          const SizedBox(height: 90),

                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: CustomElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (context) {
                                    return VerifyNumber();
                                  },
                                ));
                              },
                              text: 'Reset Password',
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
