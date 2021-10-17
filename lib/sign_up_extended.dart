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
          children: [
            Text(
              "TEST!"
            ),

            SvgPicture.asset(
              'assets/picture_mockup.svg'
            )
          ],
        ),
      ),
    );
  }
}
