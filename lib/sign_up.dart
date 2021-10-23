import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_project/utils/validator.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formEmailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formPasswordKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  updateUI() {
    setState(() => _formPasswordKey.currentState!.validate());
    setState(() => _formEmailKey.currentState!.validate());
  }

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
            Form(
              key: _formEmailKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
                        hintStyle:
                            TextStyle(color: Colors.white60, fontSize: 12),
                      ),
                      validator: getEmailValidationError,
                      onChanged: (value) {
                        _email = value;
                        _formEmailKey.currentState!.validate();
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
                  "Password",
                  style:
                      GoogleFonts.openSans(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            Form(
              key: _formPasswordKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Enter your password',
                        hintStyle:
                            TextStyle(color: Colors.white60, fontSize: 12),
                      ),
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      validator: getPasswordValidationError,
                      onChanged: (value) {
                        _password = value;
                        _formPasswordKey.currentState!.validate();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    updateUI();
                    if (getEmailValidationError(_email) == null &&
                        getPasswordValidationError(_password) == null) {
                      Navigator.pushNamed(context, '/sign_up_extended');
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
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
                      Text(
                        "Sign in",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            fontSize: 14, color: Colors.white),
                      ),
                    ],
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
