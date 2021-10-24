import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hackathon_project/ui/sign_in.dart';
import 'package:hackathon_project/ui/sign_up.dart';
import 'package:hackathon_project/ui/sign_up_extended.dart';
import 'package:flutter/services.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'chat_main.dart';
import 'my_profile.dart';
import 'create_group.dart';

void main() async {
  final client = StreamChatClient(
    'b67pax5b2wdq',
    logLevel: Level.INFO,
  );

  await client.connectUser(
    User(id: 'tutorial-flutter'),
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidHV0b3JpYWwtZmx1dHRlciJ9.S-MJpoSwDiqyXpUURgO5wVqJ4vKlIVFLSEyrFYCOE1c',
  );

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MaterialApp(
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/chat', //todo change home root
    routes: {
      '/': (context) => const SignIn(),
      '/sign_up': (context) => const SignUp(),
      '/sign_up_extended': (context) => const SignUpExtended(),
      '/my_profile': (context) => const MyProfile(),
      '/create_group': (context) => const CreateGroup(),
      '/chat': (context) =>  Chat(client: client)
    },
    debugShowCheckedModeBanner: false,
  ));
}