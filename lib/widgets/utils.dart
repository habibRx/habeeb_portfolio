import 'package:flutter/material.dart';
import 'package:habeeb_portfolio/core/colors.dart';
import 'package:habeeb_portfolio/widgets/extension.dart';


List<Map<String, Object>>  avatarData = [
  {"isImage": true, "value": "assets/images/flutter.png"},
  {"isImage": true, "value": "assets/images/firebase.png"},
  {"isImage": true, "value": "assets/images/graphql.png"},
  {"isImage": true, "value": "assets/images/rest.jpg"},
  {"isImage": false, "value": "OpenAI"},
  {"isImage": true, "value": "assets/images/mvvm.png"},
  {"isImage": true, "value": "assets/images/github.jpg"},
  {"isImage": false, "value": "Web3"},
  {"isImage": false, "value": "Wallet"},
];

List<Map<String, Object>>  projects = [
  {
    "link": "https://ecomoto-mu.vercel.app",
    "name": "ECOMOTO",
    "image": "assets/images/ecomoto.png",
    "description":
    "A peer-to-peer EV rental marketplace with integrated social features, enabling users to rent electric vehicles, connect with owners, and engage through real-time chat and community interactions.",
  },
  {
    "link":
    "https://play.google.com/store/apps/details?id=com.orokii.app&hl=en&gl=US",
    "name": "OROKII",
    "image": "assets/images/orokii.png",
    "description":
    "A decentralized finance platform focused on enabling fast, secure, and borderless crypto transactions with minimal fees.",
  },
  {
    "link": "https://ecomoto-mu.vercel.app",
    "name": "ECOBOOK",
    "image": "assets/images/ecomoto.png",
    "description":
    "A social platform built to connect eco-conscious individuals and businesses through blogs, events, and community discussions.",
  },
  {
    "link": "",
    "name": "What's My PNL",
    "image": "assets/images/whatpnl.jpg",
    "description":
    "A comprehensive trading journal that helps traders record, analyze, and optimize their performance with built-in brokerage and gain calculators, insightful reports, and smart trade tracking tools.",
  },
];

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
    backgroundColor: AppColors.background2,
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


