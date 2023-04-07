import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';
import 'package:pms_manager/router/router.dart';
import 'package:pms_manager/utils/colors.dart';

class AddAttachmentsPage extends StatefulWidget {
  const AddAttachmentsPage({Key? key}) : super(key: key);

  @override
  State<AddAttachmentsPage> createState() => _AddAttachmentsPageState();
}

class _AddAttachmentsPageState extends State<AddAttachmentsPage> {
  XFile? attachmentImage1;
  XFile? attachmentImage2;
  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage1(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      attachmentImage1 = img;
    });
  }

  //we can upload image from camera or from gallery based on parameter
  Future getImage2(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      attachmentImage2 = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
            builder: (context, p1) => SafeArea(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.filter_alt,
                          color: gold,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Image.asset('assets/png/SearchBar.png'),
                      ],
                    ),
                    const SizedBox(height: 120,),
                    SizedBox(
                      height: 130,
                      width: 191.85,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: greyCard,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        onPressed: () {
                          myAlert();
                        },
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 0,
                          margin: const EdgeInsets.all(10),
                          child: attachmentImage1 != null
                              ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                //to show image, you type like this.
                                File(attachmentImage1!.path),
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: 300,
                              ),
                            ),
                          )
                              : Image.asset(
                            'assets/png/Placeholder.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 36.7,),
                    SizedBox(
                      height: 130,
                      width: 191.85,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: greyCard,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        onPressed: () {
                          myAlert2();
                        },
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 0,
                          margin: const EdgeInsets.all(10),
                          child: attachmentImage2 != null
                              ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                //to show image, you type like this.
                                File(attachmentImage2!.path),
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: 300,
                              ),
                            ),
                          )
                              : Image.asset(
                            'assets/png/Placeholder.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 36.7,),
                    CustomElevatedButton(
                      width: 295.84,
                      height: 51.45,
                      text: 'Add Attachment', onPressed: () {
                        AutoRouter.of(context).push(const RatingPageRoute());
                    },
                    )
                  ],
                ))),
      ),
    );
  }
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage1(ImageSource.gallery);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage1(ImageSource.camera);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void myAlert2() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage2(ImageSource.gallery);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage2(ImageSource.camera);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }


}
