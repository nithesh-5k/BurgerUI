import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:burger_ui/Burger.dart';
import 'package:burger_ui/InfoPage.dart';
import 'package:burger_ui/circular_text/circular_text.dart';
import 'package:burger_ui/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class BurgerUI extends StatefulWidget {
  @override
  _BurgerUIState createState() => _BurgerUIState();
}

class _BurgerUIState extends State<BurgerUI>
    with SingleTickerProviderStateMixin {
  int count = 1;
  AnimationController _controller;

  Animation animation;

  Function burgerAnimation;

  bool greenCircle = false,
      orangeCircle = false,
      burgerAnimate = false,
      hideText = false,
      forward = true,
      backward = false,
      greenColor = false,
      nextPage = false;

  Curve _curve = Curves.easeOut;
  Duration _duration = Duration(milliseconds: 600);

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top,
        screenWidth = MediaQuery.of(context).size.width,
        screenHeight = MediaQuery.of(context).size.height;

    double burgerHeight = screenHeight * 0.3125, //200
        burgerWidth = burgerHeight * 1.35 > screenWidth * 0.75
            ? screenWidth * 0.75
            : burgerHeight * 1.35, //270
        burgerFrameHeight = screenHeight * 0.75; //500

    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      color: Colors.white,
      child: Material(
        child: Stack(
          children: [
//
            //close button
            Positioned(
              left: screenWidth * 0.04,
              top: screenHeight * 0.023,
              child: GestureDetector(
                onTap: () {
                  exit(0);
                },
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
            ),
//
            //menu icon
            AnimatedPositioned(
              duration: Duration(milliseconds: 150),
              curve: _curve,
              right: !nextPage ? screenWidth * 0.04 : screenWidth * 0.04 + 15,
              top: screenHeight * 0.017,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  setState(() {
                    nextPage = true;
                  });
                  Future.delayed(Duration(milliseconds: 140), () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => InfoPage()));
                    Future.delayed(Duration(milliseconds: 30), () {
                      setState(() {
                        nextPage = false;
                      });
                    });
                  });
                },
                child: Container(
                    padding: EdgeInsets.all(5),
                    height: 40,
                    width: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 4,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2))),
                        ),
                        Container(
                          height: 4,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2))),
                        ),
                        Container(
                          height: 4,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2))),
                        )
                      ],
                    )),
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
                      AnimatedPositioned(
                        duration: _duration,
                        curve: _curve,
                        top: !hideText ? 0 : -40,
                        child: AnimatedOpacity(
                          duration: _duration,
                          curve: _curve,
                          opacity: !hideText ? 1 : 0,
                          child: Text("BIG",
                              style: TextStyle(
                                  fontFamily: "flavors",
                                  fontSize: 60,
                                  letterSpacing: 13,
                                  color: kBlueishGreen)),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        child: AnimatedOpacity(
                          duration: _duration,
                          curve: _curve,
                          opacity: !hideText ? 1 : 0,
                          child: Text("BURGER",
                              style: TextStyle(
                                  fontFamily: "roboto",
                                  letterSpacing: animation.value * 40 + 1.5,
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
              right: screenWidth * 0.077,
              top: screenHeight * 0.188,
              child: Container(
                height: 45,
                width: 130,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: _duration,
                      curve: _curve,
                      left: !hideText ? 0 : -20,
                      child: AnimatedOpacity(
                        duration: _duration,
                        curve: _curve,
                        opacity: !hideText ? 1 : 0,
                        child: Text(
                          "BIGGER\nBETTER\nBURGER",
                          style: TextStyle(
                              fontFamily: "verdana",
                              fontSize: 12,
                              letterSpacing: 8,
                              color: kBlueishGreen),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: _duration,
                      curve: _curve,
                      right: !hideText ? 5 : -10,
                      bottom: 15,
                      child: Transform.rotate(
                        angle: pi / 2,
                        child: AnimatedOpacity(
                          duration: _duration,
                          curve: _curve,
                          opacity: !hideText ? 1 : 0,
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
                    ),
                  ],
                ),
              ),
            ),
//
            //green circle
            AnimatedPositioned(
              right: -screenWidth * 0.475,
              top: !greenCircle ? screenHeight * 0.315 : -screenHeight * 0.31,
              duration: _duration,
              curve: _curve,
              child: ClipOval(
                child: AnimatedContainer(
                  width: !greenCircle ? screenWidth * 1.2 : screenWidth * 2,
                  height: !greenCircle ? screenHeight * 0.39 : screenHeight * 2,
                  color: kBlueishGreen,
                  duration: _duration,
                  curve: _curve,
                ),
              ),
            ),
//
            //Super wooper
            AnimatedPositioned(
              top: screenHeight / 2,
              right: !hideText ? -60 : -80,
              duration: _duration,
              curve: _curve,
              child: Transform.rotate(
                angle: pi / 2,
                child: AnimatedOpacity(
                  duration: _duration,
                  curve: _curve,
                  opacity: !hideText ? 1 : 0,
                  child: Row(
                    children: [
                      Text(
                        "SUPER WOOPER ",
                        style: TextStyle(
                            fontFamily: "roboto",
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
            ),
//
            //orange circle
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              curve: _curve,
              top: !orangeCircle ? screenHeight * 0.18 : -screenHeight * 0.5,
              left: -screenWidth * 0.6,
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: _curve,
                height: !orangeCircle ? screenHeight * 0.64 : screenHeight * 2,
                width: !orangeCircle ? screenWidth * 1.2 : screenWidth * 3,
                decoration: BoxDecoration(
                    color: kOrange,
                    borderRadius: BorderRadius.all(Radius.elliptical(
                        screenWidth * 1.2, screenHeight * 0.64)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45.withOpacity(0.4),
                        offset: Offset(6.0, 6.0),
                        blurRadius: 49.0,
                      ),
                    ]),
              ),
            ),
//
            //sm0kin' burger
            AnimatedPositioned(
              duration: _duration,
              curve: _curve,
              left: !hideText ? -screenWidth * 0.6 : -screenWidth * 0.6 - 25,
              top: !hideText ? screenHeight * 0.17 : screenHeight * 0.17 + 50,
              child: AnimatedOpacity(
                duration: _duration,
                curve: _curve,
                opacity: !hideText ? 1 : 0,
                child: Visibility(
                  visible: screenHeight > 700 ? true : false,
                  child: CircularText(
                    children: [
                      TextItem(
                        text: Text(
                          "sm0kin' Burger",
                          style: TextStyle(
                            fontFamily: "verdana",
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        space: 4,
                        startAngle: -60,
                        startAngleAlignment: StartAngleAlignment.center,
                        direction: CircularTextDirection.clockwise,
                      ),
                    ],
                    radius: screenWidth * 0.6,
                    position: CircularTextPosition.outside,
                  ),
                ),
              ),
            ),
//
            //burger_all
            Positioned(
              top: screenHeight * 0.47 - (burgerFrameHeight / 2),
              left: screenWidth * 0.5 - (burgerWidth / 2),
              child: GestureDetector(
                onTap: () {
                  if (forward) {
                    animate();
                  }
                },
                child: Stack(
                  children: [
//
                    //burger_shadow
                    AnimatedPositioned(
                      duration: _duration,
                      curve: _curve,
                      bottom: !burgerAnimate
                          ? (burgerFrameHeight - burgerHeight) * 0.39
                          : 0,
                      left: burgerWidth * 0.0814,
                      child: ClipOval(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipOval(
                              child: Container(
                                height: 30,
                                width: burgerWidth * 0.70,
                                color: Colors.black54.withOpacity(1),
                              ),
                            ),
                            BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 17, sigmaY: 17),
                              child: ClipOval(
                                child: Container(
                                  height: 2,
                                  width: burgerWidth * 0.35,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
//
                    //burger
                    Container(
                      height: burgerFrameHeight,
                      width: burgerWidth,
                      child: Burger(
                        animation: burgerAnimate,
                        burgerHeight: burgerHeight,
                        burgerWidth: burgerWidth,
                        topBottom: (burgerFrameHeight - burgerHeight) / 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
//
            //ingredients
            AnimatedPositioned(
              duration: _duration,
              curve: _curve,
              left: !orangeCircle ? 10 : 20,
              bottom: screenHeight * 0.23,
              child: AnimatedOpacity(
                duration: _duration,
                curve: _curve,
                opacity: !orangeCircle ? 1 : 0,
                child: Row(
                  children: [
                    Text(
                      "INGREDIENTS",
                      style: TextStyle(
                          fontFamily: "openSans",
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
            ),
//
            //count
            Positioned(
              bottom: screenHeight * 0.0468,
              left: screenWidth * 0.0555,
              child: AnimatedOpacity(
                duration: _duration,
                curve: _curve,
                opacity: !hideText ? 1 : 0,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (count > 0 && forward) count--;
                        });
                      },
                      child: customContainer(
                        Icon(Icons.remove),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.02777,
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
                      width: screenWidth * 0.02777,
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            if (count < 9 && forward) count++;
                          });
                        },
                        child: customContainer(
                          Icon(Icons.add),
                        )),
                  ],
                ),
              ),
            ),
//
            // total price
            Positioned(
              bottom: screenHeight * 0.0468,
              right: screenWidth * 0.0555,
              child: Container(
                width: screenWidth * 0.3333,
                height: 80,
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedOpacity(
                      duration: _duration,
                      curve: _curve,
                      opacity: !hideText ? 1 : 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "PRICE:",
                            style: TextStyle(
                                fontFamily: "openSans",
                                fontSize: 12,
                                letterSpacing: 1.3,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "INR ${count * 200}",
                            style: TextStyle(
                                fontFamily: "openSans",
                                fontSize: 12,
                                letterSpacing: 1.3,
                                color: kBlueishGreen),
                          ),
                        ],
                      ),
                    ),
                    AnimatedOpacity(
                      duration: _duration,
                      curve: _curve,
                      opacity: !hideText ? 1 : 0,
                      child: Container(
                        width: screenWidth * 0.3333,
                        height: .2,
                        color: Colors.black,
                      ),
                    ),
                    AnimatedOpacity(
                      duration: _duration,
                      curve: _curve,
                      opacity: !hideText ? 1 : 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TOTAL:",
                            style: TextStyle(
                                fontFamily: "openSans",
                                fontSize: 12,
                                letterSpacing: 1.3,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "INR ${count * 200}",
                            style: TextStyle(
                                fontFamily: "openSans",
                                fontSize: 12,
                                letterSpacing: 1.3,
                                color: kBlueishGreen),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (backward) {
                          setState(() {
                            greenColor = true;
                          });
                          Future.delayed(_duration, () {
                            reverseAnimate();
                          });
                        }
                      },
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(left: 1),
                          height: 20,
                          width: 118,
                          padding: EdgeInsets.symmetric(
                              horizontal: !greenColor ? 12 : 28),
                          decoration: BoxDecoration(
                              color: !greenColor ? kOrange : Color(0xff02BD01),
                              borderRadius: BorderRadius.circular(3),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x55000029),
                                  offset: Offset(1, 1),
                                  blurRadius: 10.0,
                                ),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                !greenColor ? "ADD TO BAG  " : "ADDED",
                                style: TextStyle(
                                    fontFamily: "roboto",
                                    fontSize: 10,
                                    color: !greenColor
                                        ? Colors.black
                                        : Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Visibility(
                                visible: !greenColor,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 2),
                                  child: Icon(
                                    Icons.work,
                                    color: Colors.black,
                                    size: 10,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void animate() {
    forward = false;
    _controller.forward();
    animation.addListener(() {
      setState(() {});
    });
    setState(() {
      hideText = true;
    });
    Future.delayed(_duration, () {
      setState(() {
        greenCircle = true;
      });
      Future.delayed(_duration, () {
        setState(() {
          orangeCircle = true;
        });
        Future.delayed(Duration(milliseconds: 900), () {
          setState(() {
            burgerAnimate = true;
          });
          Future.delayed(_duration, () {
            setState(() {
              backward = true;
            });
          });
        });
      });
    });
  }

  void reverseAnimate() {
    backward = false;
    setState(() {
      burgerAnimate = false;
    });
    Future.delayed(_duration, () {
      setState(() {
        orangeCircle = false;
      });
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          greenCircle = false;
        });
        Future.delayed(_duration, () {
          _controller.reverse();
          animation.addListener(() {
            setState(() {});
          });
          setState(() {
            hideText = false;
          });
          Future.delayed(_duration, () {
            setState(() {
              forward = true;
              greenColor = false;
            });
          });
        });
      });
    });
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
