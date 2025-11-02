import 'package:flutter/material.dart';
import 'package:habeeb_portfolio/core/colors.dart';
import 'package:habeeb_portfolio/widgets/extension.dart';

ShaderMask appShaderMask({
  required BuildContext context,
  required String text,
  double? fontSize
}) {
  return ShaderMask(
    shaderCallback: (bounds) => const LinearGradient(
      colors: [
        Color(0xFFAE0CA7), // Start color
        Color(0xFF5DFFFF), // End color
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0, 1.0], // 0% → 100%
    ).createShader(bounds),
    child: Text(
      text,
      style: context.textTheme.headlineMedium!.copyWith(
        color: Color(0xFFAE0CA7),
        fontWeight: FontWeight.bold,
        fontSize: fontSize ?? 40,
      ),
    ),
  );
}




Widget appCircleAvatar(
    BuildContext context,
    double? radius,
    double? childRadius, {
      required bool isImage,
      required String value,
    }) {
  return CircleAvatar(
    radius: radius ?? 28,
    backgroundColor: AppColors.background1,
    child: CircleAvatar(
      radius: childRadius ?? 22,
      backgroundColor: Colors.transparent,
      child: ClipOval(
        child: isImage
            ? Image.asset(
          value,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover, // <-- this makes it cover the circle
        )
            : Center(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );

}

