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
            //user_name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.account_balance),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black45),
                  underline: Container(
                    height: 2,
                    color: Colors.white,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue ?? "";
                      user.institute = dropdownValue;
                    });
                  },
                  items: <String>[
                    'Institute One',
                    'Institute Two',
                    'Institute Three',
                    'Institute Four'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            //нижние кнопки
            Expanded(
              child: Container()
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/chat');
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  child: Text(
                    "Test Chat",
                    style:
                    GoogleFonts.openSans(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
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
