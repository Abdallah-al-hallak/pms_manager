import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RegisterAccount extends StatelessWidget {
  const RegisterAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (p0, p1) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/png/logo.png',
                  width: p1.maxWidth,
                )
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
}
