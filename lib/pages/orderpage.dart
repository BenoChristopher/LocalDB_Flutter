import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrderPage extends StatelessWidget {
  MyOrderPage({super.key});

  final List<Map<String, String>> foodItems = [
    {
      "title": "Chicken Biriyani",
      "description": "Spicy and flavorful biriyani.",
      "price": "MYR 38",
      "image": "assets/pexels-mumtahina-tanni-1080117-6260921.jpg",
    },
    {
      "title": "Paneer Butter Masala",
      "description": "Rich and creamy paneer dish.",
      "price": "MYR 25",
      "image": "assets/pexels-prabal-9609864.jpg",
    },
    {
      "title": "Mutton Curry",
      "description": "Tender mutton in thick curry.",
      "price": "MYR 42",
      "image": "assets/pexels-kunal-lakhotia-781256899-28674660.jpg",
    },
    {
      "title": "Prawn Masala",
      "description": "Fresh prawns cooked in spices.",
      "price": "MYR 45",
      "image": "assets/pexels-prabal-9609861.jpg",
    },
    {
      "title": "Egg Fried Rice",
      "description": "Fried rice with egg and veggies.",
      "price": "MYR 20",
      "image": "assets/pexels-prabal-9609843.jpg",
    },
    {
      "title": "Tandoori Chicken",
      "description": "Grilled chicken with masala.",
      "price": "MYR 30",
      "image": "assets/pexels-satyam-verma-2901977-4439740.jpg",
    },
    {
      "title": "Veg Manchurian",
      "description": "Crispy veg balls in sauce.",
      "price": "MYR 18",
      "image": "assets/pexels-shameel-mukkath-3421394-5639243.jpg",
    },
    {
      "title": "Butter Naan",
      "description": "Soft Indian bread with butter.",
      "price": "MYR 8",
      "image": "assets/pexels-prabal-9609864.jpg",
    },
  ];

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
          // SizedBox(
          //   height: 60,
          // ),
          Expanded(
            child: GridView.builder(
              itemCount: foodItems.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 4 columns
                childAspectRatio: 0.9, // Adjust height/width ratio
                crossAxisSpacing: 0,
                mainAxisSpacing: 30,
              ),
              itemBuilder: (context, index) => Container(
                child: Stack(children: [
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                          //color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      height: 260,
                      width: 210,
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    left: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 150,
                      width: 200,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 222, 222, 222),
                              spreadRadius: 5, // Increased spread radius
                              blurRadius: 15,
                              offset: Offset(0, 5),
                            )
                          ],

                          //color: Colors.amber,
                          // color: const Color.fromRGBO(255, 255, 255, 1),
                          color: const Color.fromARGB(255, 243, 243, 243),
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
                            foodItems[index]["title"]!,
                            style: GoogleFonts.blinker(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            foodItems[index]["description"]!,
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
                                foodItems[index]["price"]!,
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
                  ),
                  Positioned(
                    top: 1,
                    left: 15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        foodItems[index]["image"]!,
                        height: 130,
                        width: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
