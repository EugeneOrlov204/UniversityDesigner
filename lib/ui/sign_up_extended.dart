import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_project/model/user.dart';
import 'package:hackathon_project/utils/validator.dart';
import 'package:image_picker/image_picker.dart';

class SignUpExtended extends StatefulWidget {
  const SignUpExtended({Key? key}) : super(key: key);

  @override
  State<SignUpExtended> createState() => _SignUpExtendedState();
}

class _SignUpExtendedState extends State<SignUpExtended> {
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

  updateUI() {
    setState(() => _formUserNameKey.currentState?.validate());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 19, 173, 181),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: _loaded
                            ? FileImage(File(imagePath))
                            : placeholder as ImageProvider,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: IconButton(
                      icon: SvgPicture.asset(
                        'assets/images/ic_add_image.svg',
                        width: 75,
                        height: 75,
                        fit: BoxFit.cover,
                      ),
                      onPressed: _imgFromGallery,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Your profile data",
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 24.0,
              ),
            ),
            Text(
              "Fill out the profile and go to the application!",
              style: GoogleFonts.openSans(fontSize: 12, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, top: 24, bottom: 8, right: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "User name",
                  style:
                  GoogleFonts.openSans(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            Form(
              key: _formUserNameKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Enter your user name',
                        hintStyle:
                        TextStyle(color: Colors.white60, fontSize: 12),
                      ),
                      validator: getUserNameValidationError,
                      onChanged: (value) {
                        user.userName = value;
                        _formUserNameKey.currentState?.validate();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, top: 24, bottom: 8, right: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Institute",
                  style:
                  GoogleFonts.openSans(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
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
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
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
                      "Cancel",
                      style: GoogleFonts.openSans(
                          fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      updateUI();
                      if (getUserNameValidationError(user.userName) == null) {
                        Navigator.pushNamed(
                            context,
                            '/my_profile',
                            arguments: user);
                      }
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
                      "REGISTER",
                      style: GoogleFonts.openSans(
                          fontSize: 14, color: Colors.white),
                    ),
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
