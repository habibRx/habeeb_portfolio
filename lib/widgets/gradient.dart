import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  final LinearGradient gradient;
  final Color bottomColor;
  final double clipHeight;
  final double curveDepth;

  const GradientBackground({
    super.key,
    required this.child,
    required this.gradient,
    this.bottomColor = const Color(0xFF202020),
    this.clipHeight = 0.5,
    this.curveDepth = 0.15,
  });

  @override
  Widget build(BuildContext context) {
    final double calculatedClipHeight = clipHeight == 0.5
        ? MediaQuery.of(context).size.height * 0.5
        : clipHeight;

    return Scaffold(
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(
            gradient: gradient
          )),

          ClipPath(
            // clipper: UCurveClipper(curveDepth),
            child: Container(
              height: calculatedClipHeight,
              decoration: BoxDecoration(gradient: gradient),
            ),
          ),

          // Foreground content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

class UCurveClipper extends CustomClipper<Path> {
  final double depth;

  UCurveClipper(this.depth);

  @override
  Path getClip(Size size) {
    final path = Path();

    double y = size.height * (1 - depth);
    double controlY = size.height;

    path.lineTo(0, y);

    path.quadraticBezierTo(
      size.width / 2, controlY,
      size.width, y,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}


