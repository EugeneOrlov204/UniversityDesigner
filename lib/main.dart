import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hackathon_project/sign_in.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: SignIn(),
    ),
  ));
}
