import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/utils/colors.dart';
import 'package:pms_manager/utils/helper/theme_helper.dart';


class AddUnit extends StatefulWidget {
  AddUnit({super.key});
  @override
  _AddUnitState createState() => _AddUnitState();
}


class _AddUnitState extends State<AddUnit> {
  // text editing controllers
  final unitNameController = TextEditingController();
  final passwordController = TextEditingController();
  final Key _formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  XFile? addImage;
  List<File> _imageList = [];



  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      addImage = img;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
            builder: (context, p1) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset("assets/png/ArrowBack.png"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Add Unit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('(Regular)',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              decoration: ThemeHelper().inputBoxDecorationShadow(),
                              child: TextField(
                                decoration: ThemeHelper().textInputDecoration('Add Unit', 'Enter unit name'),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Container(
                              decoration: ThemeHelper().inputBoxDecorationShadow(),
                              child: TextField(
                                obscureText: true,
                                decoration: ThemeHelper().textInputDecoration('Owner Name', 'Enter Owner Name', const Icon(
                                  Icons.qr_code_scanner_sharp,
                                  color: Colors.black,
                                ),),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Row(
                              children: [
                                Flexible(
                                  child:Container(
                                    decoration: ThemeHelper().inputBoxDecorationShadow(),
                                    child: TextField(
                                      decoration: ThemeHelper().textInputDecoration('Category', '',
                                        const RotatedBox(
                                          quarterTurns: 1,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: gold,
                                              size: 18,
                                            ),
                                            onPressed: null,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12.4),
                                Flexible(
                                  child:Container(
                                    decoration: ThemeHelper().inputBoxDecorationShadow(),
                                    child: TextField(
                                      decoration: ThemeHelper().textInputDecoration('Type', '',
                                        const RotatedBox(
                                          quarterTurns: 1,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: gold,
                                              size: 18,
                                            ),
                                            onPressed: null,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 30.0),
                            Container(
                              decoration: ThemeHelper().inputBoxDecorationShadow(),
                              child: TextField(
                                obscureText: true,
                                decoration: ThemeHelper().textInputDecoration('Address', 'Enter the Address'),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Container(
                              decoration: ThemeHelper().inputBoxDecorationShadow(),
                              child: TextField(
                                obscureText: true,
                                decoration: ThemeHelper().textInputDecoration('Location URL', 'Enter the location URL'),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Row(
                              children: [
                                Flexible(
                                  child:Container(
                                    decoration: ThemeHelper().inputBoxDecorationShadow(),
                                    child: TextField(
                                      decoration: ThemeHelper().textInputDecoration('Bedrooms', '',
                                        const RotatedBox(
                                          quarterTurns: 1,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: gold,
                                              size: 18,
                                            ),
                                            onPressed: null,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12.4),
                                Flexible(
                                  child:Container(
                                    decoration: ThemeHelper().inputBoxDecorationShadow(),
                                    child: TextField(
                                      decoration: ThemeHelper().textInputDecoration('Bathrooms', '',
                                        const RotatedBox(
                                          quarterTurns: 1,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: gold,
                                              size: 18,
                                            ),
                                            onPressed: null,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 30.0),
                            Container(
                              decoration: ThemeHelper().inputBoxDecorationShadow(),
                              child: TextField(
                                obscureText: true,
                                decoration: ThemeHelper().textInputDecoration('Unit Size', 'Enter the unit Size'),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            InkWell(
                              onTap: (){
                                myAlert();
                              },
                              child: Container(
                                child: addImage != null
                                    ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Row(
                                      children: [
                                        Image.file(
                                          //to show image, you type like this.
                                          File(addImage!.path),
                                          fit: BoxFit.cover,
                                          width: 130,
                                          height: 100,
                                        ),
                                        const SizedBox(width: 20,),
                                        InkWell(
                                          onTap: (){
                                            myAlert();
                                          },
                                            child: const Icon(Icons.add)),
                                      ],
                                    ),
                                  ),
                                )
                                    :Row(
                                children: const [
                                  RotatedBox(
                                    quarterTurns: 1,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.add_link,
                                        color: textGrey,
                                        size: 33,
                                      ),
                                      onPressed: null,
                                    ),
                                  ),
                                  Text('Add Image',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: textGrey
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            const SizedBox(height: 26.0),
                            Row(
                              children: const [
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.add_link,
                                      color: textGrey,
                                      size: 33,
                                    ),
                                    onPressed: null,
                                  ),
                                ),
                                Text('Add Documents',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: textGrey
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30.0),
                            Container(
                              height: 114.51,
                              decoration: ThemeHelper().inputBoxDecorationShadow(),
                              child: TextFormField(
                                minLines: 6,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  labelStyle: const TextStyle(color: textGrey, ),
                                  hintStyle: const TextStyle(color: gold, ),
                                  labelText: 'Notes',
                                  fillColor: Colors.white,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(11.0), borderSide: const BorderSide(color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(11.0), borderSide: const BorderSide(color: Colors.white)),
                                  errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(11.0), borderSide: const BorderSide(color: Colors.red, width: 2.0)),
                                  focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(11.0), borderSide: const BorderSide(color: Colors.red, width: 2.0)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            CustomElevatedButton(
                              onPressed: () {
                                // AutoRouter.of(context).push();
                                _dialogBuilder(context);
                              },
                              text: 'Save',
                              height: 51.45,
                              width: 295.84,
                            ),
                            const SizedBox(height: 30.0),

                          ],
                        )
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }


  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 5,
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
                  const SizedBox(height: 20,),
                  const Center(
                    child: Text('Please choose media to select',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: gold,)
                  ),
                ],
              ),
            ),
          );
        });
  }
}


Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Center(
          child: const Text('Your building has been added successfully!',
            style: TextStyle(color: Colors.white),
            maxLines: 2,
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Disable'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}