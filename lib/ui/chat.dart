import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chat extends StatefulWidget {
  var client;

   Chat({Key? key, required this.client}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 19, 173, 181),
        foregroundColor: Colors.white,
        title: Text(
          'Группа КН 3.02.01',
          style: GoogleFonts.openSans(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(24, 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  "Новости",
                  style: GoogleFonts.openSans(fontSize: 14, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  "Ссылки на пары",
                  style: GoogleFonts.openSans(fontSize: 14, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
