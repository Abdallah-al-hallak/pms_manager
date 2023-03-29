import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/router/router.dart';
import 'package:pms_manager/utils/colors.dart';


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

                          const Padding(
                            padding: EdgeInsets.only(left: 55, right: 55),
                            child: Center(
                              child: Flexible(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Please, enter the verification code we sent to your Phone Number',
                                  style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                  ),
                                  // style: TextStyle(color: Colors.grey[700]),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for(var i=0; i<6; i++)
                                  CustomDigit(context),
                              ],
                            ),
                          ),

                          const SizedBox(height: 31),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Didn\'t receive the code? ',
                              ),
                              Text(
                                'Resend Code',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 52),

                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: CustomElevatedButton(
                              onPressed: () {
                                AutoRouter.of(context)
                                    .push(ResetPasswordRoute());
                              },
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

 CustomDigit(context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        height: 50,
        width: 50,
        child: TextField(
          onChanged: (value){
            if (value.length == 1){
              FocusScope.of(context).nextFocus();
            }
          },
          style: Theme.of(context).textTheme.headline6,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          cursorColor: gold,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
      ),
    ],
  );
}
