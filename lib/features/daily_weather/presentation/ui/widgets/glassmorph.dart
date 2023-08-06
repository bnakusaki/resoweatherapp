import 'dart:ui';

import 'package:flutter/material.dart';

class Glassmorph extends StatelessWidget {
  final double height;
  final double width;
  final Widget? child;
  const Glassmorph({
    super.key,
    required this.height,
    required this.width,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.white.withOpacity(0.05),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.15),
                    Colors.white.withOpacity(0.05),
                  ],
                ),
              ),
            ),
            Center(
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
