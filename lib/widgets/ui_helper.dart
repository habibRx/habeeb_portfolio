// helpers/ui_helpers.dart
import 'package:flutter/material.dart';
import 'package:habeeb_portfolio/widgets/extension.dart';

class UIHelpers {
  // Text styles
  static TextStyle displayLarge(BuildContext context, {bool isMobile = false}) {
    return Theme.of(context).textTheme.displayLarge!.copyWith(
      fontSize: isMobile ? context.viewSize.width*.1 : context.viewSize.width*.05,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  static TextStyle headlineSmall(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall!.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle bodyLarge(BuildContext context, {bool isMobile = false}) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
      fontSize: isMobile ? context.viewSize.width*.05 : context.viewSize.width*.02,
      color: Colors.white,
      height: 1.5,
    );
  }

  static TextStyle titleLarge(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge!.copyWith(
      color: Colors.white70,
      height: 1.6,
    );
  }

  // Shader mask for section titles
  static Widget sectionTitle(BuildContext context, String text) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [Colors.blue.shade400, Colors.purple.shade400],
      ).createShader(bounds),
      child: Text(
        text,
        style: headlineSmall(context).copyWith(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Section padding
  static EdgeInsets sectionPadding(bool isMobile) {
    return EdgeInsets.symmetric(
      horizontal: isMobile ? 20 : 100,
      vertical: isMobile ? 40 : 60,
    );
  }

  // Button style
  static ButtonStyle elevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    );
  }

  // Spacing
  static SizedBox verticalSpace(double height) => SizedBox(height: height);
  static SizedBox horizontalSpace(double width) => SizedBox(width: width);

  // Common animations
  static Duration get animationDuration => const Duration(milliseconds: 500);
  static Curve get animationCurve => Curves.easeInOut;

  // Screen size helpers
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
          MediaQuery.of(context).size.width < 1200;
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1200;
}