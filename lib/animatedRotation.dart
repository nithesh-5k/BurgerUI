import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnimatedRotation extends StatefulWidget {
  Widget child;
  double lowerBound, upperBound;
  Duration duration;
  bool animateFlag, negate;

  AnimatedRotation(
      {this.child,
      this.lowerBound,
      this.upperBound,
      this.duration,
      this.animateFlag,
      this.negate});

  @override
  _AnimatedRotationState createState() => _AnimatedRotationState();
}

class _AnimatedRotationState extends State<AnimatedRotation>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
      upperBound: widget.upperBound,
      lowerBound: widget.lowerBound,
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animateFlag) {
      animationController.forward();
      animationController.addListener(() {
        setState(() {
          animationController.value;
        });
      });
    } else {
      animationController.reverse();
      animationController.addListener(() {
        setState(() {
          animationController.value;
        });
      });
    }
    return Transform.rotate(
      angle: widget.negate
          ? -animationController.value
          : animationController.value,
      child: widget.child,
    );
  }
}
