import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthertask/auth/localdatabase.dart';
import 'package:smarthertask/components/textfield.dart';
import 'package:smarthertask/components/button.dart';

class MyRegisterPage extends StatelessWidget {
  final VoidCallback onToggle;
  MyRegisterPage({super.key, required this.onToggle});

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confrimPassController = TextEditingController();

  void register(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passController.text.trim();
    String confrimpass = confrimPassController.text.trim();

    if (email.isEmpty || password.isEmpty || confrimpass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Please fill all fields"),
        ),
      );
      return;
    }

    if (password != confrimpass) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Passwords do not match"),
        ),
      );
      return;
    }

    final db = DatabaseHelper.instance;
    final existingUser = await db.getUser(email);

    if (existingUser != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email already exists!")),
      );
    } else {
      await db.registerUser(email, password);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration Successful!")),
      );
      onToggle();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'SIGN UP',
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
                    'Please sign up',
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
                    height: 16,
                  ),
                  Text(
                    'Re-Enter Password',
                    style: GoogleFonts.blinker(fontSize: 16),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  MyTextField(
                    controller: confrimPassController,
                    hinttext: "Re-Enter your password ",
                  ),
                  SizedBox(
                    height: 94,
                  ),
                  MyButton(
                    buttonName: "SignUp",
                    onPressed: () {
                      register(context);
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
                      "SignIn",
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
