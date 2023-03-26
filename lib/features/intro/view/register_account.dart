import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pms_manager/features/intro/widgets/my_textfield.dart';
import 'package:pms_manager/utils/styles.dart';

class RegisterAccount extends StatefulWidget {
  const RegisterAccount({super.key});

  @override
  State<RegisterAccount> createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  final userNameController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (p0, p1) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/png/logo.png',
                  width: p1.maxWidth,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Account Type',
                    style: gooldTextStyle(),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  child: Text(
                    'Account Type',
                    style: gooldTextStyle(),
                    textAlign: TextAlign.start,
                  ),
                ),
                MyTextField(
                    controller: nameController,
                    hintText: 'Name',
                    obscureText: false),
                SizedBox(width: 0.0, height: p1.maxHeight / 35),
                MyTextField(
                    controller: userNameController,
                    hintText: 'UserName',
                    obscureText: false),
                SizedBox(width: 0.0, height: p1.maxHeight / 35),
                MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false),
                SizedBox(width: 0.0, height: p1.maxHeight / 35),
                MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: false),
                SizedBox(width: 0.0, height: p1.maxHeight / 35),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum AccountType { rent, own, type }

class RegisterAccountObject extends Equatable {
  AccountType accountType;
  String userName;
  String name;
  String email;
  String password;
  bool accept;
  RegisterAccountObject({
    required this.accountType,
    required this.userName,
    required this.name,
    required this.email,
    required this.password,
    required this.accept,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [accept, accountType, password, email, userName, name];

  RegisterAccountObject copyWith({
    AccountType? accountType,
    String? userName,
    String? name,
    String? email,
    String? password,
    bool? accept,
  }) {
    return RegisterAccountObject(
      accountType: accountType ?? this.accountType,
      userName: userName ?? this.userName,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      accept: accept ?? this.accept,
    );
  }
}
