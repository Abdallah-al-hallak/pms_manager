import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/features/intro/widgets/my_textfield.dart';
import 'package:pms_manager/router/router.dart';


class AddNumber extends StatelessWidget {
  AddNumber({super.key});

  // text editing controllers
  final phoneNumberController = TextEditingController();


  @override
  Widget build(BuildContext context) {
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
                              hintText: 'Phone Number',
                              obscureText: false,
                            ),
                          ),

                          const SizedBox(height: 25),

                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: CustomElevatedButton(
                              onPressed: () {
                                AutoRouter.of(context).push(VerifyNumberRoute());
                              },
                              text: 'Send Code',
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
