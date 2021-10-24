import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_project/model/user.dart';
import 'package:hackathon_project/utils/validator.dart';
import 'package:image_picker/image_picker.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();


  }


class _MyProfileState extends State<MyProfile> {
  @override

  final GlobalKey<FormState> _formUserNameKey = GlobalKey<FormState>();
  String dropdownValue = 'Institute One';
  String imagePath = "";
  UserModel user = UserModel();
  bool _loaded = false;
  var placeholder = const AssetImage("assets/images/ic_user_mockup.png");

  _imgFromGallery() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (image == null) {
        imagePath = "";
        _loaded = false;
      } else {
        imagePath = image.path;
        _loaded = true;
        user.imagePath = imagePath;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 19, 173, 181),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                //кнопка Settings
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 24, right: 0, top: 4),
                    child: TextButton(
                      onPressed: () {
                        color: Colors.grey;
                        print('Just pressed');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      child: Text(
                        'Settings',
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                //кнопка Log Out
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(left: 325, right: 0, top: 4),
                    child: TextButton(
                      onPressed: () {
                        color: Colors.grey;
                        print('Just pressed');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      child: Text(
                        'Log Out',
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ]
            ),
            //фотокарточка
            Container(
              width: 150,
              height: 150,
              padding: EdgeInsets.only(left: 0, right: 0, top: 40),
              decoration:  const BoxDecoration(
                shape: BoxShape.circle,
                image:  DecorationImage(
                  image:  AssetImage('assets/images/ha.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 20,
            ),
            //user_name
            Align(
              //padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.topCenter,
              child: SizedBox(
                //width: double.infinity,
                child: Text(
                    "Eugene Tank",
                style:
                GoogleFonts.openSans(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            //группа
            Align(
              //padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.topCenter,
              child: SizedBox(
                //width: double.infinity,
                child: Text(
                  "Студент группы КН 3.2.2",
                  style:
                  GoogleFonts.openSans(fontSize: 14, color: Colors.grey[50]),
                ),
              ),
            ),
            Container(
              height:  20,
            ),
            //bio
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Container(
                    child: SizedBox(
                      //width: double.infinity,
                      child: Text(
                        "Bio:",
                        style:
                        GoogleFonts.openSans(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: 500,
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 165),
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      //width: double.infinity,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Maecenas in velit massa.\n Praesent sit amet est at ligula condimentum bibendum quis vitae ex.\n Integer et tempor augue, sed lobortis arcu. Duis cursus mi eu sem euismod condimentum.\n Vivamus quis orci sollicitudin, auctor enim eu, molestie felis. Ut tristique justo a mattis tristique.\n Sed lacinia sagittis ante sit amet convallis. Aenean vehicula nunc in tempus mattis.\n In imperdiet dui sit amet semper rhoncus. Aliquam euismod quis lectus eget tempus.\n Vivamus viverra est non aliquet commodo. Sed placerat, justo at dapibus feugiat, odio nibh imperdiet elit, vitae convallis justo nisl aliquet massa. Vivamus consectetur lectus id semper venenatis.\n",
                        maxLines: 10,
                        style:
                        GoogleFonts.openSans(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ]
              ),
            ),

            //нижние кнопки
            Expanded(
              child: Container()
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/chat');
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  child: Text(
                    "Edit profile",
                    style:
                    GoogleFonts.openSans(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              height: 20,
            ),
            //кнопка View my contacts
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/chat');
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    /*shape: const RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),*/
                  ),
                  child: Text(
                    "View my contacts",
                    style:
                    GoogleFonts.openSans(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
