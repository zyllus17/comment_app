import 'package:flutter/material.dart';
import 'package:comment_app/page/error/error.ui.dart';
import 'package:comment_app/page/home/home.ui.dart';
import 'package:comment_app/page/login/login.ui.dart';
import 'package:comment_app/page/signup/signup.ui.dart';
import 'package:provider/provider.dart';
import 'package:comment_app/services/auth.service.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) {
          return Consumer<AuthService>(
            builder: (context, authService, _) {
              return authService.user == null
                  ? const LoginScreen()
                  : const HomeScreen();
            },
          );
        });
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorScreen());
    }
  }
}
