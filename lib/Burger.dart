import 'dart:math';

import 'package:burger_ui/animatedRotation.dart';
import 'package:flutter/material.dart';

class Burger extends StatefulWidget {
  bool animation;

  Burger(this.animation);

  @override
  _BurgerState createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  double _top = 150, _bottom = 150;

  Curve _curve = Curves.easeOut;
  Duration _duration = Duration(milliseconds: 600);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            bottom: !widget.animation ? _bottom : 25,
            child: BurgerPart(
              negate: true,
              animateFlag: widget.animation,
              initialAngle: 0,
              finalAngle: pi * 0.08,
              image: "assets/bunbottom.png",
              height: 105, //147
              width: 236, //294
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            left: 15,
            bottom: !widget.animation ? _bottom + 20 : 70,
            child: BurgerPart(
              animateFlag: widget.animation,
              initialAngle: 0,
              finalAngle: pi * 0.05,
              image: "assets/meat.png",
              height: 115, //161
              width: 220, //274
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            bottom: !widget.animation ? _bottom + 23 : 140,
            right: 40,
            child: Transform.rotate(
              angle: 345,
              child: BurgerPart(
                image: "assets/mozzarella2.png",
                height: 98, //138
                width: 126, //157
              ),
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            bottom: !widget.animation ? _bottom + 45 : 140,
            left: 8,
            child: BurgerPart(
              image: "assets/mozzarella.png",
              height: 94, //132
              width: 166, //207
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            left: 30,
            bottom: !widget.animation ? _bottom + 70 : 200,
            child: BurgerPart(
              image: "assets/mozzarella 3.png",
              height: 93, //131
              width: 173, //216
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            bottom: !widget.animation ? _bottom + 40 : 155,
            left: 50,
            child: BurgerPart(
              image: "assets/tomato1.png",
              height: 78, //110
              width: 150, //187
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            bottom: !widget.animation ? _bottom + 70 : 230,
            left: 130,
            child: BurgerPart(
              image: "assets/onion2.png",
              height: 27, //39
              width: 65, //81
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            left: 0,
            bottom: _bottom + 60,
            child: BurgerPart(
              negate: true,
              animateFlag: widget.animation,
              initialAngle: 0,
              finalAngle: pi * 0.25,
              image: "assets/tomato2.png",
              height: 55, //78
              width: 122, //153
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            left: 100,
            bottom: !widget.animation ? _bottom + 80 : 250,
            child: BurgerPart(
              image: "assets/tomato3.png",
              height: 50, //71
              width: 106, //133
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            bottom: !widget.animation ? _bottom + 70 : 250,
            left: 30,
            child: BurgerPart(
              negate: true,
              animateFlag: widget.animation,
              initialAngle: 0,
              finalAngle: pi * .15,
              image: "assets/onion3.png",
              height: 42, //60
              width: 63, //79
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            bottom: !widget.animation ? _bottom + 75 : 270,
            right: 15,
            child: BurgerPart(
              image: "assets/onion.png",
              height: 59, //83
              width: 190, //237
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            left: -20,
            bottom: !widget.animation ? _bottom + 50 : 270,
            child: BurgerPart(
              image: "assets/salad.png",
              height: 77, //108
              width: 171, //214
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            right: 20,
            bottom: !widget.animation ? _bottom + 50 : 300,
            child: BurgerPart(
              image: "assets/salad2.png",
              height: 97, //136
              width: 218, //272
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            top: !widget.animation ? _top + 35 : 20,
            left: -12,
            child: BurgerPart(
              negate: true,
              animateFlag: widget.animation,
              initialAngle: 0,
              finalAngle: pi / 10,
              image: "assets/buntop.png",
              height: 113,
              //155
              width: 270, //336
            ),
          ),
        ],
      ),
    );
  }
}

class BurgerPart extends StatelessWidget {
  String image;
  double initialAngle, finalAngle;
  double height, width;
  bool animateFlag, negate;

  BurgerPart(
      {this.image,
      this.height,
      this.width,
      this.initialAngle = 0,
      this.finalAngle = 2 * pi,
      this.animateFlag = false,
      this.negate = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      negate: negate,
      lowerBound: initialAngle,
      upperBound: finalAngle,
      animateFlag: this.animateFlag,
      duration: Duration(milliseconds: 600),
      child: Container(
        child: Image.asset(
          image,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
