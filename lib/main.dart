import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/theme.dart';
import 'core/router.dart';

void main()async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Portfolio',
      theme: appTheme,
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => LayoutBuilder(
        builder: (context, constraints) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
            child: child!,
          );
        },
      ),
    );

    // MaterialApp.router(
    //   title: 'My Portfolio',
    //   theme: appTheme,
    //   routerConfig: goRouter,
    //   debugShowCheckedModeBanner: false,
    // );
  }
}