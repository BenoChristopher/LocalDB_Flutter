// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smarthertask/auth/loginorregister.dart';

// class MyDrawer extends StatelessWidget {
//   final String? userEmail;
//   MyDrawer({super.key, this.userEmail});

//   void logout(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('user_email'); // Remove login data

//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => LoginorRegister()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // // Logout Icon
//             IconButton(
//               icon: Icon(Icons.logout, size: 30),
//               onPressed: () => logout(context),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amberAccent,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Handle item 1 tap
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Handle item 2 tap
            },
          ),
        ],
      ),
    );
  }
}
