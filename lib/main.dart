import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hackathon_project/sign_in.dart';
import 'package:hackathon_project/sign_up.dart';

void main() {
  runApp(MaterialApp(
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => const SignIn(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => const SignUp(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
