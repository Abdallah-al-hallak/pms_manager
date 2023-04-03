import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pms_manager/features/home/view/home_view.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/features/intro/widgets/custom_text.dart';
import 'package:pms_manager/features/intro/widgets/my_textfield.dart';
import 'package:pms_manager/router/router.dart';
import 'package:pms_manager/utils/colors.dart';
import 'package:pms_manager/utils/styles.dart';
import 'package:pms_manager/utils/widgets/custom_radio_butt.dart';

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
  AccountType accountType = AccountType.own;
  bool accept = false;
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
                Row(
                  children: [
                    Text(
                      'Account Type',
                      style: gooldTextStyle(),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(width: 10.0, height: 0.0),
                    IconButton(
                      onPressed: () {
                        showAccountTypeDialog(context);
                      },
                      icon: const Icon(Icons.info_outline),
                      color: gold,
                    ),
                  ],
                ),
                SizedBox(width: 0.0, height: p1.maxHeight / 37),
                const Text(
                  'Do You Want To: ',
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.start,
                ),
                // Radio Buttons
                SizedBox(
                  width: 300,
                  child: LanguageRadioRow(
                    color: gold,
                    textColor: lightDark,
                    groupValue: accountType,
                    value: AccountType.rent,
                    onChanged: (value) {
                      //TODO Engilsh logic language
                      setState(() {
                        accountType = value!;
                      });
                    },
                    text: 'rent property',
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: LanguageRadioRow(
                    color: gold,
                    textColor: lightDark,
                    groupValue: accountType,
                    value: AccountType.own,
                    onChanged: (value) {
                      //TODO Engilsh logic language
                      setState(() {
                        accountType = value!;
                      });
                    },
                    text: 'own property',
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: LanguageRadioRow(
                    color: gold,
                    textColor: lightDark,
                    groupValue: accountType,
                    value: AccountType.manage,
                    onChanged: (value) {
                      //TODO Engilsh logic language
                      setState(() {
                        accountType = value!;
                      });
                    },
                    text: 'manage property',
                  ),
                ),
                // TextField
                SizedBox(width: 0.0, height: p1.maxHeight / 37),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      MyTextField(
                          controller: nameController,
                          hintText: 'Name',
                          obscureText: false),
                      SizedBox(width: 0.0, height: p1.maxHeight / 37),
                      MyTextField(
                          controller: userNameController,
                          hintText: 'UserName',
                          obscureText: false),
                      SizedBox(width: 0.0, height: p1.maxHeight / 37),
                      MyTextField(
                          controller: emailController,
                          hintText: 'Email',
                          obscureText: false),
                      SizedBox(width: 0.0, height: p1.maxHeight / 37),
                      MyTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          obscureText: false),
                    ],
                  ),
                ),
                SizedBox(width: 0.0, height: p1.maxHeight / 37),
                //check nox
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      fillColor: MaterialStateProperty.all<Color>(gold),
                      side: const BorderSide(color: gold, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      value: accept,
                      onChanged: (value) {
                        setState(() {
                          accept = !accept;
                        });
                      },
                    ),
                    const CustomText(text: 'Accept Eula', color: lightDark),
                    const SizedBox(width: 10.0, height: 0.0),
                    const Icon(
                      Icons.info_outline,
                      color: gold,
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: CustomElevatedButton(
                      text: 'Next',
                      onPressed: () {
                        showDialogForPropertyDocs(context);
                        // AutoRouter.of(context).replace(const HomeRoute());
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum AccountType { rent, own, manage }

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

showAccountTypeDialog(BuildContext context) {
  return showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Center(
        child: SizedBox(
          width: 185,
          height: 185,
          child: Card(
            elevation: 5,
            color: gold,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'loremipsum lorem ipsum loremsdaroigjaorigjaeoirvjerouugheru',
                style: TextStyle(color: Colors.white, fontSize: 15),
                textAlign: TextAlign.justify,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
        ),
      );
    },
  );
}

showDialogForPropertyDocs(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return LayoutBuilder(builder: (context, p1) {
        return Center(
          child: SizedBox(
            height: p1.maxHeight / 2,
            width: p1.maxWidth / 1.2,
            child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const DialogPropertWidget()),
          ),
        );
      });
    },
  );
}

class DialogPropertWidget extends StatefulWidget {
  const DialogPropertWidget({super.key});

  @override
  State<DialogPropertWidget> createState() => _DialogPropertWidgetState();
}

class _DialogPropertWidgetState extends State<DialogPropertWidget> {
  PropertyAttachment propertyAttachment = PropertyAttachment.property;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              AutoRouter.of(context).pop();
            },
            child: Container(
              width: 30,
              height: 30,
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: gold),
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 0.0, height: 50.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LanguageRadioRow(
                textColor: lightDark,
                color: gold,
                groupValue: propertyAttachment,
                value: PropertyAttachment.office,
                onChanged: (value) async {
                  //TODO define routes to go to office
                  setState(() {
                    propertyAttachment = value!;
                  });
                  await Future.delayed(const Duration(milliseconds: 500));
                  // ignore: use_build_context_synchronously
                },
                text: 'Are you a real estate Office',
              ),
              LanguageRadioRow(
                color: gold,
                textColor: lightDark,
                groupValue: propertyAttachment,
                value: PropertyAttachment.property,
                onChanged: (value) async {
                  setState(() {
                    propertyAttachment = value!;
                  });
                  await Future.delayed(const Duration(milliseconds: 500));
                  // ignore: use_build_context_synchronously
                  //TODO define routes to go to documents properrty
                  // takee the enum insede your page
                },
                text: 'Do you want to manage your property',
              ),
              const SizedBox(width: 0.0, height: 50),
              CustomElevatedButton(
                text: 'Select',
                onPressed: () {
                  AutoRouter.of(context).push(CreateAccountRoute(
                      propertyAttachment: propertyAttachment));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

enum PropertyAttachment { office, property }
