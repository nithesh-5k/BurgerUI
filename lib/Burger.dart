import 'package:flutter/material.dart';

class Burger extends StatefulWidget {
  @override
  _BurgerState createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: BurgerPart(
              image: "assets/bunbottom.png",
              height: 105, //147
              width: 236, //294
            ),
          ),
          Positioned(
            left: 15,
            bottom: 20,
            child: BurgerPart(
              image: "assets/meat.png",
              height: 115, //161
              width: 220, //274
            ),
          ),
          Positioned(
            bottom: 23,
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
          Positioned(
            bottom: 45,
            left: 8,
            child: BurgerPart(
              image: "assets/mozzarella.png",
              height: 94, //132
              width: 166, //207
            ),
          ),
          Positioned(
            bottom: 40,
            left: 50,
            child: BurgerPart(
              image: "assets/tomato1.png",
              height: 78, //110
              width: 150, //187
            ),
          ),
          Positioned(
            bottom: 70,
            left: 80,
            child: BurgerPart(
              image: "assets/onion2.png",
              height: 27, //39
              width: 65, //81
            ),
          ),
          Positioned(
            left: 30,
            bottom: 70,
            child: BurgerPart(
              image: "assets/mozzarella 3.png",
              height: 93, //131
              width: 173, //216
            ),
          ),
          Positioned(
            left: 0,
            bottom: 60,
            child: BurgerPart(
              image: "assets/tomato2.png",
              height: 55, //78
              width: 122, //153
            ),
          ),
          Positioned(
            left: 70,
            bottom: 80,
            child: BurgerPart(
              image: "assets/tomato3.png",
              height: 50, //71
              width: 106, //133
            ),
          ),
          Positioned(
            bottom: 70,
            left: 30,
            child: BurgerPart(
              image: "assets/onion3.png",
              height: 42, //60
              width: 63, //79
            ),
          ),
          Positioned(
            bottom: 75,
            right: 15,
            child: BurgerPart(
              image: "assets/onion.png",
              height: 59, //83
              width: 190, //237
            ),
          ),
          Positioned(
            left: -20,
            bottom: 50,
            child: BurgerPart(
              image: "assets/salad.png",
              height: 77, //108
              width: 171, //214
            ),
          ),
          Positioned(
            right: 20,
            bottom: 50,
            child: BurgerPart(
              image: "assets/salad2.png",
              height: 97, //136
              width: 218, //272
            ),
          ),
          Positioned(
            top: 35,
            left: -12,
            child: BurgerPart(
              image: "assets/buntop.png",
              height: 113, //155
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
  double height, width;

  BurgerPart({this.image, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        image,
        height: height,
        width: width,
      ),
    );
  }
}
