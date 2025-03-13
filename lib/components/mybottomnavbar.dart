import 'package:flutter/material.dart';
import 'package:smarthertask/pages/bookingpage.dart';
import 'package:smarthertask/pages/homepage.dart';
import 'package:smarthertask/pages/orderpage.dart';
import 'package:smarthertask/pages/profilepage.dart';

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true), home: const NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: Colors.grey[50],
        indicatorColor: Colors.grey[50],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home_filled,
              color: Colors.red,
            ),
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.shopping_bag,
              color: Colors.red,
            ),
            icon: Icon(Icons.shopping_bag),
            label: 'My Order',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.messenger_sharp,
              color: Colors.red,
            ),
            icon: Icon(Icons.messenger_sharp),
            label: 'My Booking',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
              color: Colors.red,
            ),
            icon: Icon(Icons.person),
            label: 'LogOut',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        MyHomePage(),

        /// My order page
        MyOrderPage(),
        MyBookingPage(),
        MyProfilePage(),
      ][currentPageIndex],
    );
  }
}
