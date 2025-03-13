import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarthertask/auth/loginorregister.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  void logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear login data

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginorRegister()),
      (route) => false, // Remove all previous routes
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('LogOut'),
            IconButton(
              icon: Icon(Icons.logout, size: 30),
              onPressed: () => logout(context),
            ),
          ],
        ),
      ),
    );
  }
}
