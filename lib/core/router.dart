import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/home_page.dart';
import '../pages/about_page.dart';
import '../pages/contact_page.dart';
import '../pages/projects.dart';

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'about',
          builder: (context, state) => const Center(),
        ),
        GoRoute(
          path: 'projects',
          builder: (context, state) => const ProjectsPage(),
        ),
        GoRoute(
          path: 'contact',
          builder: (context, state) => const Center(),
        ),
      ],
    ),
  ],
);