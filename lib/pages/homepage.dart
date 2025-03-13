import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarthertask/auth/loginorregister.dart';

class MyHomePage extends StatelessWidget {
  final String? userEmail;
  const MyHomePage({super.key, this.userEmail});

  void logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_email'); // Remove login data

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginorRegister()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => logout(context),
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
