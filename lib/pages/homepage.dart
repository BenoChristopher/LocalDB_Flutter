import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarthertask/auth/loginorregister.dart';
import 'package:smarthertask/components/appbar.dart';
import 'package:smarthertask/components/mydrawer.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:smarthertask/pages/foodpage.dart';

class MyHomePage extends StatefulWidget {
  final String? userEmail;

  MyHomePage({super.key, this.userEmail});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_email'); // Remove login data

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginorRegister()),
    );
  }

  int _currentIndex = 0;

  final List<String> items = [
    "assets/pngwing.com.png",
    "assets/pngwing.com.png",
    "assets/pngwing.com.png",
    "assets/pngwing.com.png",
    "assets/pngwing.com.png",
  ];

  bool isPickupSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          CustomAppBar(),
          SizedBox(
            height: 20,
          ),
          ExpandableCarousel(
            options: ExpandableCarouselOptions(
              autoPlay: true,
              showIndicator: false,
              autoPlayInterval: const Duration(seconds: 2),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      margin: EdgeInsets.only(
                        right: 10,
                      ),
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/blackmarble.jpg",
                            ),
                            fit: BoxFit.cover,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Text(
                                'WELCOME TO BENO',
                                style: GoogleFonts.chewy(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Text(
                                'CURRY HOUSE',
                                style: GoogleFonts.chewy(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: 170,
                              width: 170,
                              child: Image.asset("assets/pngwing.com.png"))
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 12), // Space between carousel and indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(items.length, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: _currentIndex == index ? 16 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentIndex == index ? Colors.green : Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
              );
            }),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isPickupSelected = true;
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: isPickupSelected
                              ? Colors.red.shade50
                              : Colors.grey[50],
                          border: Border.all(
                            color: isPickupSelected
                                ? Colors.red.shade200
                                : Colors.grey.shade50,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      height: 180,
                      width: 180,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 125,
                            width: 125,
                            child: Image.asset(
                              "assets/food.png",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Text(
                            "Order Pickup",
                            style: GoogleFonts.blinker(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isPickupSelected = false;
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: !isPickupSelected
                              ? Colors.red.shade50
                              : Colors.grey[50],
                          border: Border.all(
                            color: !isPickupSelected
                                ? Colors.red.shade200
                                : Colors.grey.shade50, // Change border
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      height: 180,
                      width: 180,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 125,
                            width: 125,
                            child: Image.asset(
                              "assets/table.png",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Text(
                            "Table Reservation",
                            style: GoogleFonts.blinker(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              // color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Order',
                  style: GoogleFonts.blinker(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    // color: Colors.grey.shade400,
                  ),
                ),
                Text(
                  'My Bookings',
                  style: GoogleFonts.blinker(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    // color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Stack(
              children: [
                Divider(
                  thickness: 2,
                ),
                Container(
                  height: 6,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            height: 120,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  spreadRadius: 5, // Increased spread radius
                  blurRadius: 15,
                  offset: Offset(0, 5),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 50,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Order #KCH26032",
                      style: GoogleFonts.blinker(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Placed on 12 Jan 2025",
                      style: GoogleFonts.blinker(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400),
                    ),
                    Text(
                      "Item :02",
                      style: GoogleFonts.blinker(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        // color: Colors.grey.shade400,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            height: 120,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  spreadRadius: 5, // Increased spread radius
                  blurRadius: 15,
                  offset: Offset(0, 5),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 50,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Order #X26032",
                      style: GoogleFonts.blinker(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Placed on 14 Feb 2025",
                      style: GoogleFonts.blinker(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400),
                    ),
                    Text(
                      "Item :04",
                      style: GoogleFonts.blinker(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        // color: Colors.grey.shade400,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
