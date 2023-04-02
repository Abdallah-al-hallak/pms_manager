import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/router/router.dart';
import 'package:pms_manager/utils/colors.dart';


class VerifyNumber extends StatefulWidget {
  VerifyNumber({super.key});

  @override
  _VerifyNumberState createState() => _VerifyNumberState();
}

  // text editing controllers
  final phoneNumberController = TextEditingController();

  // sign user in method
  class _VerifyNumberState extends State<VerifyNumber>{
    @override
  void initState() {
    super.initState();
    starterTimer();
    setState(() {
      dispelledButton = true;
      startTimer = 30;
    });

  }
    int startTimer = 30;
    bool dispelledButton = false;
    String buttonName = 'Verify Phone';
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        // backgroundColor: Colors.grey[300],
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

                            const SizedBox(height: 30),


                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  otpField(context),
                                ],
                              ),
                            ),

                            const SizedBox(height: 31),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Didn\'t receive the code? ',
                                ),
                                InkWell(
                                  onTap: dispelledButton
                                      ?null: () {
                                    starterTimer();
                                    setState(() {
                                      dispelledButton = true;
                                      startTimer = 30;
                                    });
                                  },
                                  child: InkWell(
                                    onTap: dispelledButton
                                        ?null: () {
                                      starterTimer();
                                      setState(() {
                                        dispelledButton = true;
                                        startTimer = 30;
                                      });
                                    },
                                    child: RichText(
                                        text:  TextSpan(
                                          children: [
                                            TextSpan(
                                                text:'Resend Code',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: dispelledButton ? Colors.grey : Colors.black,
                                              ),
                                            ),
                                          ]
                                    )),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 30),

                            RichText(
                                text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:'00:$startTimer',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ]
                                )),

                            const SizedBox(height: 52),

                            Padding(
                              padding: const EdgeInsets.only(left: 25, right: 25),
                              child: CustomElevatedButton(
                                onPressed: () {
                                  AutoRouter.of(context)
                                      .push(ResetPasswordRoute());
                                },
                                text: buttonName,
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

    void starterTimer(){
      const onSec = Duration(seconds: 1);
      Timer _timer = Timer.periodic(onSec, (timer) {
        if (startTimer == 0){
          setState(() {
            timer.cancel();
            dispelledButton = false;
          });
        }
        else{
          setState(() {
            startTimer--;
          });
        }
      });
    }
    Widget otpField(context){
      return OtpTextField(
        numberOfFields: 6,
        borderColor: textGrey,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        showFieldAsBox: true,
        cursorColor: gold,
        focusedBorderColor: gold,
        onCodeChanged: (String code) {
          //handle validation or checks here
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode){
          showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: const Text("Verification Code"),
                  content: Text('Code entered is $verificationCode'),
                );
              }
          );
        }, // end onSubmit
      );
    }

  }




