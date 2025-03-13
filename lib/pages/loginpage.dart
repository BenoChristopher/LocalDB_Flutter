import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarthertask/auth/localdatabase.dart';
import 'package:smarthertask/components/mybottomnavbar.dart';
import 'package:smarthertask/components/textfield.dart';
import 'package:smarthertask/pages/homepage.dart';

import '../components/button.dart';

class MyLoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final VoidCallback onToggle;
  MyLoginPage({super.key, required this.onToggle});

  void login(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passController.text.trim();

    final db = DatabaseHelper.instance;
    final user = await db.getUser(email);

    if (user != null && user['password'] == password) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_email', email);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavigationExample(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid email or password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'SIGN IN',
            style: GoogleFonts.blinker(fontSize: 16),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, Welcome',
                    style: GoogleFonts.blinker(
                        fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Happy to see you again! Please SignIn',
                    style: GoogleFonts.blinker(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 52,
                  ),
                  Text(
                    'Email Address',
                    style: GoogleFonts.blinker(fontSize: 16),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  MyTextField(
                    controller: emailController,
                    hinttext: "Enter your email address",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Password',
                    style: GoogleFonts.blinker(fontSize: 16),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  MyTextField(
                    controller: passController,
                    hinttext: "Enter your password",
                  ),
                  SizedBox(
                    height: 94,
                  ),
                  MyButton(
                    buttonName: "SignIn",
                    onPressed: () {
                      login(context);
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: GoogleFonts.blinker(fontSize: 14),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: onToggle,
                    child: Text(
                      "SignUp",
                      style: GoogleFonts.blinker(
                          fontSize: 14, color: Colors.amberAccent),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
