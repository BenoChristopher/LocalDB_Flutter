// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smarthertask/components/mybottomnavbar.dart';
// import 'auth/loginorregister.dart';
// import 'pages/homepage.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? userEmail = prefs.getString('user_email');

//   runApp(MyApp(userEmail: userEmail));
// }

// class MyApp extends StatelessWidget {
//   final String? userEmail;
//   const MyApp({super.key, this.userEmail});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: userEmail == null ? LoginorRegister() : NavigationExample(),
//     );
//   }
// }
// //

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarthertask/components/mybottomnavbar.dart';
import 'auth/loginorregister.dart';
import 'pages/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userEmail = prefs.getString('user_email');

  runApp(MyApp(userEmail: userEmail));
}

class MyApp extends StatelessWidget {
  final String? userEmail;
  const MyApp({super.key, this.userEmail});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      debugShowCheckedModeBanner: false,
      home: userEmail == null ? LoginorRegister() : NavigationExample(),
    );
  }
}
