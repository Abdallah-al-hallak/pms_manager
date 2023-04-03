import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/features/intro/widgets/my_textfield.dart';
import 'package:pms_manager/features/phone_auth/view/add_number.dart';
import 'package:pms_manager/features/phone_auth/view/forgot_password.dart';
import 'package:pms_manager/router/router.dart';
import 'package:pms_manager/utils/colors.dart';
import 'register_account.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
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

                          // username textfield
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: MyTextField(
                              controller: usernameController,
                              hintText: 'Username',
                              obscureText: false,
                            ),
                          ),

                          const SizedBox(height: 10),

                          // password textfield
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: MyTextField(
                              controller: passwordController,
                              hintText: 'Password',
                              obscureText: true,
                            ),
                          ),

                          const SizedBox(height: 10),

                          // forgot password?
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Temporary, needs validation
                                    AutoRouter.of(context)
                                        .push(ForgotPasswordRoute());
                                  },
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 25),

                          // sign in button
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: CustomElevatedButton(
                              onPressed: () {
                                AutoRouter.of(context).push(AddUnitRoute());
                                // Navigator.pushReplacement(context,
                                //     MaterialPageRoute(
                                //   builder: (context) {
                                //     return AddNumber();
                                //   },
                                // ));
                                AutoRouter.of(context)
                                    .replace(const HomeRoute());
                              },
                              text: 'Sign In',
                              height: 50,
                            ),
                          ),
                          const SizedBox(
                            height: 43,
                          ),
                          InkWell(
                              onTap: () {
                                showAboutDialogFingerPrint(context);
                              },
                              child: Image.asset("assets/png/fingerPrint.png")),
                          const SizedBox(height: 60),
                          // not a member? register now
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                // style: TextStyle(color: Colors.grey[700]),
                              ),
                              const SizedBox(width: 4),
                              GestureDetector(
                                onTap: () {
                                  // Temporary, needs validation
                                  AutoRouter.of(context)
                                      .push(VerifyNumberRoute());
                                },
                                child: const Text(
                                  'Create Account',
                                  style: TextStyle(
                                    // color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
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

showAboutDialogFingerPrint(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return LayoutBuilder(builder: (context, p1) {
        return Center(
          child: SizedBox(
            height: p1.maxHeight / 3.0,
            width: p1.maxWidth / 1.2,
            child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: const CustomDialog()),
          ),
        );
      });
    },
  );
}

class CustomDialog extends StatefulWidget {
  const CustomDialog({super.key});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  PropertyAttachment propertyAttachment = PropertyAttachment.property;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Center(
              child: Text(
            'Verify your identetiy',
            style: TextStyle(
              color: textGrey,
            ),
          )),
          const SizedBox(
            height: 14,
          ),
          Center(
            child: SizedBox(
              height: 45,
              width: 45,
              child: Image.asset('assets/png/fingerPrint.png'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
              child: Text(
            'Touch the fingerprint sensor',
            style: TextStyle(
              color: textGrey,
            ),
          )),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: CustomElevatedButton(
              width: 153,
              text: 'Cancel',
              onPressed: () {
                AutoRouter.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
