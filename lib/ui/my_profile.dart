import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(24.0),
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
            Container(
              width: 200,
              height: 200,
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                image:  DecorationImage(
                  image:  AssetImage('assets/images/ha.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
