import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hackathon_project/sign_in.dart';
import 'package:hackathon_project/sign_up.dart';
import 'package:hackathon_project/sign_up_extended.dart';

import 'my_profile.dart';
///TODO: fix design on big screens
void main() {
  runApp(MaterialApp(
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      '/': (context) => const SignIn(),
      '/sign_up': (context) => const SignUp(),
      '/sign_up_extended': (context) => const SignUpExtended(),
      '/my_profile': (context) => const MyProfile()
    },
    debugShowCheckedModeBanner: false,
  ));
}
