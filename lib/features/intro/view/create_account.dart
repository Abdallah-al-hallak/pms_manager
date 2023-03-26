import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pms_manager/features/intro/widgets/custom_buton.dart';


// class CreateAccount extends StatelessWidget {
//   CreateAccount({super.key});
//
//   // text editing controllers
//   final phoneNumberController = TextEditingController();
//
//   // sign user in method
//   void signUserIn() {}
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       body: SingleChildScrollView(
//         child: LayoutBuilder (
//             builder: (context, p1)=>
//                 SafeArea(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           // logo
//                           Image.asset(
//                             "assets/png/logo.png",
//                             fit: BoxFit.contain,
//                           ),
//
//                           const SizedBox(height: 15),
//
//                           Padding(
//                             padding: const EdgeInsets.only(left: 25, right: 25),
//                             child: CustomElevatedButton(
//                               onPressed: () {  },
//                               text: 'Create Account',
//                               height: 50,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//         ),
//       ),
//     );
//   }
// }


class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  myAlert();
                },
                child: Column(
                    children: [
                      Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.asset(
                          'assets/png/Placeholder.png',
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                      Card(
                        child: Image.asset(
                          'assets/png/Placeholder.png',
                          fit: BoxFit.cover,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                      Card(
                        child: Image.asset(
                          'assets/png/Placeholder.png',
                          fit: BoxFit.cover,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                  ]
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //if image not null show the image
              //if image null show text
              image != null
                  ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    //to show image, you type like this.
                    File(image!.path),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                  ),
                ),
              )
                  : Text(
                "No Image",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}