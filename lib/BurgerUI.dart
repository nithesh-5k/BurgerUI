import 'dart:math';
import 'dart:ui';

import 'package:burger_ui/Burger.dart';
import 'package:burger_ui/CustomClipperOval.dart';
import 'package:burger_ui/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class BurgerUI extends StatefulWidget {
  @override
  _BurgerUIState createState() => _BurgerUIState();
}

class _BurgerUIState extends State<BurgerUI> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width,
        screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      child: Material(
        child: SafeArea(
          child: Stack(
            children: [
//
              //close button
              Positioned(
                left: screenWidth * 0.04,
                top: screenHeight * 0.023,
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
//
              //menu icon
              Positioned(
                right: screenWidth * 0.04,
                top: screenHeight * 0.017,
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 40,
                ),
              ),
//
              //Big Burger
              Positioned(
                top: screenHeight * 0.01,
                child: Container(
                  height: 100,
                  width: screenWidth,
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: double.infinity,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 0,
                          child: Text(
                            "BIG",
                            style: GoogleFonts.flavors(
                                textStyle: TextStyle(
                                    fontSize: 60,
                                    letterSpacing: 13,
                                    color: kBlueishGreen)),
                          ),
                        ),
                        Positioned(
                          top: 60,
                          child: Text(
                            "BURGER",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: kOrange)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
//
              //Bigger Better Burger
              Positioned(
                right: 28,
                top: 120,
                child: Container(
                  height: 45,
                  width: 130,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        child: Text(
                          "BIGGER\nBETTER\nBURGER",
                          style: TextStyle(
                              fontFamily: "verdana",
                              fontSize: 12,
                              letterSpacing: 8,
                              color: kBlueishGreen),
                        ),
                      ),
                      Positioned(
                        right: 5,
                        bottom: 15,
                        child: Transform.rotate(
                          angle: pi / 2,
                          child: Text(
                            "JOINT",
                            style: TextStyle(
                                fontFamily: "verdana",
                                fontSize: 12,
                                color: kOrange,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
//
              //green circle
              Positioned(
                right: -screenWidth * 0.475,
                top: screenHeight * 0.31,
                child: ClipOval(
                  child: Container(
                    width: screenWidth * 1.2,
                    height: screenHeight * 0.39,
                    color: kBlueishGreen,
                  ),
                ),
              ),
//
              //Super wooper
              Positioned(
                top: screenHeight / 2,
                right: -60,
                child: Transform.rotate(
                  angle: pi / 2,
                  child: Row(
                    children: [
                      Text(
                        "SUPER WOOPER ",
                        style: GoogleFonts.roboto(
                            fontSize: 13,
                            letterSpacing: 5,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
//
              //sm0kin' burger
              Positioned(
                child: Text(" "),
              ),
//
              //orange circle
              Positioned(
                top: screenHeight * 0.18,
                left: -screenWidth * 0.6,
                child: ClipOvalShadow(
                  shadow: Shadow(
                    color: Colors.black45,
                    offset: Offset(20.0, 20.0),
                    blurRadius: 49.0,
                  ),
                  clipper: CustomClipperOval(),
                  child: ClipOval(
                    child: Container(
                      height: screenHeight * 0.64,
                      width: screenWidth * 1.2,
                      color: kOrange,
                    ),
                  ),
                ),
              ),
//
              //burger
              Positioned(
                top: screenHeight * 0.31,
                left: 27,
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 270,
                      child: Burger(),
                    ),
                  ],
                ),
              ),
//
              //burger_shadow
              Positioned(
                top: screenHeight * 0.63,
                left: 50,
                child: ClipOval(
                  child: Container(
                    height: 30,
                    width: 200,
                    color: Colors.black.withOpacity(0.35),
                  ),
                ),
              ),
//
              //ingredients
              Positioned(
                left: 10,
                bottom: screenHeight * 0.23,
                child: Row(
                  children: [
                    Text(
                      "INGREDIENTS",
                      style: GoogleFonts.openSans(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
//
              //count
              Positioned(
                bottom: 30,
                left: 20,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          print(1);
                          if (count > 0) count--;
                          print(count);
                        });
                      },
                      child: customContainer(
                        Icon(Icons.remove),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    customContainer(Text(
                      count.toString(),
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "verdana",
                          color: kBlueishGreen,
                          fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            if (count < 9) count++;
                          });
                        },
                        child: customContainer(
                          Icon(Icons.add),
                        )),
                  ],
                ),
              ),
//
              // total price
              Positioned(
                bottom: 30,
                right: 20,
                child: Container(
                  width: 120,
                  height: 80,
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "PRICE:",
                            style: GoogleFonts.openSans(
                                fontSize: 12,
                                letterSpacing: 1.3,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "INR ${count * 200}",
                            style: GoogleFonts.openSans(
                                fontSize: 12,
                                letterSpacing: 1.3,
                                color: kBlueishGreen),
                          ),
                        ],
                      ),
                      Container(
                        width: 120,
                        height: .2,
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TOTAL:",
                            style: GoogleFonts.openSans(
                                fontSize: 12,
                                letterSpacing: 1.3,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "INR ${count * 200}",
                            style: GoogleFonts.openSans(
                                fontSize: 12,
                                letterSpacing: 1.3,
                                color: kBlueishGreen),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 1),
                        height: 20,
                        width: 118,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            color: kOrange,
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x55000029),
                                offset: Offset(1, 1),
                                blurRadius: 10.0,
                              ),
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ADD TO BAG",
                              style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  color: Colors.black,
                                  letterSpacing: 1.1,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.work,
                              size: 10,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget customContainer(Widget x) {
  return Container(
    height: 29,
    width: 29,
    child: Center(child: x),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Color(0x55000029),
          offset: Offset(1, 1),
          blurRadius: 16.0,
        ),
      ],
    ),
  );
}
