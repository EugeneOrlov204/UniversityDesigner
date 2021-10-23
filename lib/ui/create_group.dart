import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 19, 173, 181),
            ),
            child: Column(children: <Widget>[
              //самый верх
              Row(
                children: [
                  //кнопка "в ангар"
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
                    child: IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/back_arrow.svg',
                          height: 16,
                          width: 16,
                          color: Colors.white,
                          fit: BoxFit.scaleDown,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/my_profile');
                        }
                    ),
                  ),
                  //текст "New Group"
                  Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.only(left: 180, right: 0, top: 4),
                    child: Text(
                      'New Group',
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  //кнопка "поиск ...заработной платы"
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 180, right: 0, top: 4),
                    child: IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/search.svg',
                          height: 16,
                          width: 16,
                          color: Colors.white,
                          fit: BoxFit.scaleDown,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/my_profile');
                        }
                    ),
                  ),
                ]
              ),
              //текст up to ... members
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
                child: Text(
                  'up to 300 members',
                  style: GoogleFonts.openSans(
                    color: Colors.grey[50],
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0,
                  ),
                ),
              ),
              //строка ввода
              _getChatMembersField(),
              //кнопка контакта
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 75,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/create_group');
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
                      "Test",
                      style:
                      GoogleFonts.openSans(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ]),

        ),
    );
  }

  Widget _getChatMembersField() {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    bool emailValid(String email) {
      return RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
    }

    String? _validateEmail(String? value) {
      if (value == null || value.isEmpty) {
        return 'Добавить участников...';
      } else if (!emailValid(value)) {
        return 'Пользователь не найден';
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
                hintText: 'Добавить участников...',
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
}
