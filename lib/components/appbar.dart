import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthertask/components/mydrawer.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 180,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.amberAccent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // Scaffold.of(context)
                            //     .openDrawer(); // Open the drawer
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 6),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 3.5,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      color: Colors.black,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                ),
                                Container(
                                  height: 3.5,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      color: Colors.black,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                ),
                                Container(
                                  height: 3.5,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      color: Colors.black,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Hi, Beno !',
                        style: GoogleFonts.blinker(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Center(
                          child: Stack(
                            children: [
                              Icon(
                                Icons.notifications_none,
                                size: 35,
                              ),
                              Positioned(
                                left: 18,
                                top: -0,
                                child: Container(
                                  height: 14,
                                  width: 14,
                                  padding: EdgeInsets.only(bottom: 1),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                  child: Center(
                                    child: Text(
                                      '2',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Center(
                          child: Icon(
                            Icons.person,
                            size: 35,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                          padding: EdgeInsets.all(2),
                          child: Icon(
                            Icons.pin_drop,
                            size: 14,
                          )),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Bedok New Town, SG.04',
                      style: GoogleFonts.blinker(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        // color: Colors.grey.shade400,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
