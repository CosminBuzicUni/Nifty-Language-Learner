
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nifty_language_learner/screens/credentials_screen.dart';
import 'package:nifty_language_learner/screens/language_screen.dart';
import 'package:nifty_language_learner/screens/welcome_screen.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'language_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const LanguageScreen();
          },
        ),
        GoRoute(path: 'credentials_screen', builder: (BuildContext context, GoRouterState state) {
          return const CredentialsScreen();
        }),
      ],
    ),
  ],
);