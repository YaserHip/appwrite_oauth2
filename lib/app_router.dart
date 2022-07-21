import 'package:appwrite_phone_login/page_home.dart';
import 'package:appwrite_phone_login/page_login.dart';
import 'package:appwrite_phone_login/page_verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const loginPage = '/loginPage';
  static const verificationPage = '/verificationPage';
  static const homePage = '/';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.homePage:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const HomePage(),
            settings: settings,
            fullscreenDialog: true);
      case AppRoutes.loginPage:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const LoginPage(),
            settings: settings,
            fullscreenDialog: true);
      case AppRoutes.verificationPage:
        return MaterialPageRoute(
            builder: (_) => const VerificationPage(),
            settings: settings,
            fullscreenDialog: true);
    }
  }
}
