import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpExtended extends StatefulWidget {
  const SignUpExtended({Key? key}) : super(key: key);

  @override
  State<SignUpExtended> createState() => _SignUpExtendedState();
}

class _SignUpExtendedState extends State<SignUpExtended> {
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
              padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      SvgPicture.asset('assets/images/picture_background.svg'),
                      SvgPicture.asset('assets/images/user_mockup.svg'),
                    ],
                  ),
                  SvgPicture.asset('assets/images/ic_add_image.svg'),
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
            _getUserNameField(),
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
            const InstituteFieldWidget(),
            Expanded(
              child: Container(),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign_up_extended');
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
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign_up_extended');
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
          ],
        ),
      ),
    );
  }
}

_getUserNameField() {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool emailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  String? _validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name!';
    } else if (value.length <= 5) {
      return 'Your name must contains at least 6 characters';
    }
    return null;
  }

  return Form(
    key: _formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'Enter your user name',
              hintStyle: TextStyle(color: Colors.white60, fontSize: 12),
            ),
            validator: _validateUserName,
            onFieldSubmitted: (value) {
              _formKey.currentState!.validate();
            },
          ),
        ),
      ],
    ),
  );
}

/// This is the stateful widget that the main application instantiates.
class InstituteFieldWidget extends StatefulWidget {
  const InstituteFieldWidget({Key? key}) : super(key: key);

  @override
  State<InstituteFieldWidget> createState() => _InstituteFieldWidgetState();
}

class _InstituteFieldWidgetState extends State<InstituteFieldWidget> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              dropdownValue = newValue!;
            });
          },
          items: <String>['One', 'Two', 'Three', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
