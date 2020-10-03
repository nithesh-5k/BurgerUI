import 'dart:ui';

import 'package:burger_ui/const.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  bool connectAnimation = false;
  Color highlightedBlue = Color(0xff2A43AB);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 20,
                child: Text(
                  "BurgerUI",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: "verdana",
                      color: kBlueishGreen),
                ),
              ),
              Positioned(
                top: 80,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height - 200,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(children: [
                            TextSpan(
                              text:
                                  "I have designed this UI to get experience with the technicalities of animation-based and responsive pages. I believe in my work and I personally feel that this work has achieved considerable responsiveness to fulfill the very goal.\n\nThe Burger UI is designed by ",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                                text: "Rajveer Singh",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: highlightedBlue,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    launch(
                                        "https://www.linkedin.com/feed/update/urn:li:ugcPost:6707199191749328896?commentUrn=urn%3Ali%3Acomment%3A%28ugcPost%3A6707199191749328896%2C6707279066518712320%29");
                                  }),
                            TextSpan(
                              text:
                                  " which I have converted into a Flutter code base. I have hands-on experience in working with both orthodox and unorthodox designs though I always prefer to work on unorthodox UI design, considering the scope of exploration and learning is potentially higher. The reason behind the size of the current apk being a little on the heavier side is that of it being a fat apk. In case of the lack of idea around fat apk, do check out my ",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                                text: "blog",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: highlightedBlue,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    launch(
                                        "https://medium.com/@5nithesh011/does-the-flutter-apk-size-really-matter-edbb85623e");
                                  }),
                            TextSpan(
                              text:
                                  ".\n\nIf you haven't checked my first application named ",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                                text: "Connect",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: highlightedBlue,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    animateConnect();
                                  }),
                            TextSpan(
                              text:
                                  ". Kindly do go ahead and check it out for an overview of my work on the UI and the idea of the application as a whole, which you might personally like. The source code of the Burger UI has been pushed into GitHub and I am also open to collaborate for competitions, hackathons, or paid projects if the mobile application is a part of it.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                        width: !connectAnimation ? 20 : 15,
                        height: 65,
                      ),
                      GestureDetector(
                        onTap: () {
                          launch(
                              "https://play.google.com/store/apps/details?id=com.fluidlabs.connect");
                        },
                        child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeOut,
                            height: !connectAnimation ? 55 : 65,
                            width: !connectAnimation ? 55 : 65,
                            child: Image.asset("assets/icons/connect.png")),
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                        width: !connectAnimation ? 20 : 15,
                        height: 65,
                      ),
                      GestureDetector(
                        onTap: () {
                          launch("https://www.linkedin.com/in/nithesh05/");
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/icons/linkedin.png")),
                      ),
                      SizedBox(
                        width: 20,
                        height: 65,
                      ),
                      GestureDetector(
                        onTap: () {
                          launch("https://github.com/nithesh-5k/BurgerUI");
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/icons/github.png")),
                      ),
                      SizedBox(
                        width: 20,
                        height: 65,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void animateConnect() {
    setState(() {
      connectAnimation = true;
    });
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        connectAnimation = false;
      });
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          connectAnimation = true;
        });
        Future.delayed(Duration(milliseconds: 500), () {
          setState(() {
            connectAnimation = false;
          });
        });
      });
    });
  }
}
