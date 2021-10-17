import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
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
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 168),
              child: Text(
                "Let's get acquainted",
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                ),
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
                  "Email",
                  style:
                      GoogleFonts.openSans(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            _getEmailField(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, top: 24, bottom: 8, right: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style:
                      GoogleFonts.openSans(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            _getPasswordField(),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 120),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
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
                    style:
                        GoogleFonts.openSans(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 45,
              alignment: Alignment.center,
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an account?",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          fontSize: 14, color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Sign in",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _getEmailField() {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool emailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email!';
    } else if (!emailValid(value)) {
      return 'You entered invalid email!';
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
              hintText: 'Enter your email',
              hintStyle: TextStyle(color: Colors.white60, fontSize: 12),
            ),
            validator: _validateEmail,
            onFieldSubmitted: (value) {
              _formKey.currentState!.validate();
            },
          ),
        ),
      ],
    ),
  );
}

Widget _getPasswordField() {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password!';
    } else if (value.length < 8) {
      return 'Your password must include a minimum of 8 characters.';
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
              hintText: 'Enter your password',
              hintStyle: TextStyle(color: Colors.white60, fontSize: 12),
            ),
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            validator: _validatePassword,
            onFieldSubmitted: (value) {
              _formKey.currentState!.validate();
            },
          ),
        ),
      ],
    ),
  );
}
