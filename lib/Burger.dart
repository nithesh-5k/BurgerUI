import 'dart:math';

import 'package:burger_ui/animatedRotation.dart';
import 'package:flutter/material.dart';

class Burger extends StatefulWidget {
  bool animation;

  double burgerWidth, burgerHeight, topBottom;

  Burger({this.animation, this.burgerWidth, this.burgerHeight, this.topBottom});

  @override
  _BurgerState createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  double _top, _bottom, _burgerWidth, _burgerHeight;
  Curve _curve = Curves.easeOut;
  Duration _duration = Duration(milliseconds: 600);

  @override
  Widget build(BuildContext context) {
    _top = widget.topBottom;
    _bottom = widget.topBottom; //150 in my device
    _burgerHeight = widget.burgerHeight; //200 in my device
    _burgerWidth = widget.burgerWidth; //270 in my device

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
              height: _burgerHeight * 0.525,
              //147
              width: _burgerWidth * 0.874, //294
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
              height: _burgerHeight * 0.575,
              //161
              width: _burgerWidth * 0.814, //274
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
                height: _burgerHeight * 0.49, //138
                width: _burgerWidth * 0.466, //157
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
              height: _burgerHeight * 0.47, //132
              width: _burgerWidth * 0.614, //207
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            left: 30,
            bottom: !widget.animation ? _bottom + 70 : 200,
            child: BurgerPart(
              image: "assets/mozzarella 3.png",
              height: _burgerHeight * 0.465, //131
              width: _burgerWidth * 0.64, //216
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            bottom: !widget.animation ? _bottom + 40 : 155,
            left: 50,
            child: BurgerPart(
              image: "assets/tomato1.png",
              height: _burgerHeight * 0.39, //110
              width: _burgerWidth * 0.5555, //187
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            bottom: !widget.animation ? _bottom + 70 : 230,
            left: 130,
            child: BurgerPart(
              image: "assets/onion2.png",
              height: _burgerHeight * 0.135, //39
              width: _burgerWidth * 0.24, //81
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
              height: _burgerHeight * 0.275,
              //78
              width: _burgerWidth * 0.451, //153
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            left: 100,
            bottom: !widget.animation ? _bottom + 80 : 250,
            child: BurgerPart(
              image: "assets/tomato3.png",
              height: _burgerHeight * 0.25, //71
              width: _burgerWidth * 0.392, //133
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
              height: _burgerHeight * 0.21,
              //60
              width: _burgerWidth * 0.2333, //79
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            bottom: !widget.animation ? _bottom + 75 : 270,
            right: 15,
            child: BurgerPart(
              image: "assets/onion.png",
              height: _burgerHeight * 0.295, //83
              width: _burgerWidth * 0.7, //237
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            left: -20,
            bottom: !widget.animation ? _bottom + 50 : 270,
            child: BurgerPart(
              image: "assets/salad.png",
              height: _burgerHeight * 0.385, //108
              width: _burgerWidth * 0.6333, //214
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            right: _burgerWidth * 0.74,
            bottom: !widget.animation ? _bottom + (_bottom / 3) : (_bottom * 2),
            child: BurgerPart(
              image: "assets/salad2.png",
              height: _burgerHeight * 0.485, //136
              width: _burgerWidth * 0.8, //272
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            curve: _curve,
            top: !widget.animation ? _top + (_top * 0.2333) : _top * 0.133,
            left: -(_burgerWidth * 0.0444),
            child: BurgerPart(
              negate: true,
              animateFlag: widget.animation,
              initialAngle: 0,
              finalAngle: pi / 10,
              image: "assets/buntop.png",
              height: _burgerHeight * 0.565,
              //155
              width: _burgerWidth, //336
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
