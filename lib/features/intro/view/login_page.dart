import 'package:flutter/material.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/features/intro/widgets/my_textfield.dart';
import 'package:pms_manager/features/phone_auth/view/add_number.dart';
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
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.grey[600]),
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
                            Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) {
                                return AddNumber();
                              },
                            ));
                          },
                          text: 'Sign In',
                          height: 50,
                        ),
                      ),

                      const SizedBox(height: 20),

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
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) {
                                  return const RegisterAccount();
                                },
                              ));
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
                      )
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
