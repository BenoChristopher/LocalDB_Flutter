import 'package:flutter/material.dart';
import 'package:smarthertask/pages/loginpage.dart';
import 'package:smarthertask/pages/registerpage.dart';

class LoginorRegister extends StatefulWidget {
  const LoginorRegister({super.key});

  @override
  State<LoginorRegister> createState() => _LoginorRegisterState();
}

class _LoginorRegisterState extends State<LoginorRegister> {
  bool showSigninPage = true;

  void togglePages() {
    setState(() {
      showSigninPage = !showSigninPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showSigninPage
          ? MyLoginPage(onToggle: togglePages)
          : MyRegisterPage(
              onToggle: togglePages,
            ),
    );
  }
}
