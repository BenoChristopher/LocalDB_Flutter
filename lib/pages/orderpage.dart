import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrderPage extends StatelessWidget {
  const MyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          Stack(
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    child: Icon(Icons.arrow_back_ios_new)),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'View Items',
                              style: GoogleFonts.blinker(
                                  fontSize: 24, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 30, top: 20, right: 30),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              prefixIconColor: Colors.grey[700],
                              hintText: "Search Food",
                              hintStyle: GoogleFonts.blinker(
                                  color: Colors.grey[700], fontSize: 16),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Stack(children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 180,
              width: 200,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Chicken Biriyani",
                    style: GoogleFonts.blinker(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Lofnsbhfb khnfbsnfbs ndfbsdnb fm hnfkbdfb hNFBDF  NBVFBDVF nbnhbn nBFndbf hkkvnbfv jhVFJHBVDF nbvEFVFB bVERFBVDA bvfbvf ",
                    style: GoogleFonts.blinker(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "MYR 38",
                        style: GoogleFonts.blinker(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            Positioned(
                child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.asset(
                "assets/pexels-kunal-lakhotia-781256899-28674660.jpg",
                height: 150,
                width: 170,
                fit: BoxFit.cover,
              ),
            )),
          ])
        ],
      ),
    );
  }
}
