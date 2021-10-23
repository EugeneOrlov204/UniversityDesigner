import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hackathon_project/ui/sign_in.dart';
import 'package:hackathon_project/ui/sign_up.dart';
import 'package:hackathon_project/ui/sign_up_extended.dart';
import 'package:flutter/services.dart';

import 'my_profile.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

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
