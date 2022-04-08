import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlass extends StatelessWidget {
  const FrostedGlass({
    Key? key,
    required this.height,
    required this.width,
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    required this.sigmaX,
    required this.sigmaY,
  }) : super(key: key);

  final BorderRadius borderRadius;
  final double height;
  final double width;
  final Widget child;
  final double sigmaX;
  final double sigmaY;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: borderRadius,
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
                child: Container(
                  height: height,
                  width: width,
                  color: Colors.lightBlue.shade100.withOpacity(.2),
                )),
          ),
          ClipRRect(
            borderRadius: borderRadius,
            child: Opacity(
                opacity: 0.1,
                child: Image.asset(
                  "lib/assets/noise.png",
                  fit: BoxFit.cover,
                  width: width,
                  height: height,
                )),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: borderRadius,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.28),
                    spreadRadius: 2.0,
                    blurRadius: 10.0,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.28),
                    blurRadius: 2.0,
                    spreadRadius: 10.0,
                    offset: const Offset(0.0, 0.0),
                  )
                ],
                border: Border.all(
                    color: Colors.white.withOpacity(0.3), width: 1.0),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.6),
                    ],
                    stops: [
                      1.0,
                      0.0,
                    ])),
            child: child,
          ),
        ],
      ),
    );
  }
}
