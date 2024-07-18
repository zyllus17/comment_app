import 'package:comment_app/firebase_options.dart';
import 'package:comment_app/page/error/error.ui.dart';
import 'package:comment_app/page/home/home.ui.dart';
import 'package:comment_app/page/login/login.ui.dart';
import 'package:comment_app/page/signup/signup.ui.dart';
import 'package:comment_app/services/auth.service.dart';
import 'package:comment_app/services/loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint('Firebase initialization error: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService(LoadingState())),
        ChangeNotifierProvider(create: (_) => LoadingState()),
      ],
      child: MaterialApp(
        title: 'Comments App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Consumer<AuthService>(
                builder: (context, authService, _) {
                  return authService.user == null
                      ? LoginScreen()
                      : const HomeScreen();
                },
              ),
          '/signup': (context) => SignupScreen(),
          '/login': (context) => LoginScreen(),
          '/home': (context) => const HomeScreen(),
        },
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) => const ErrorScreen());
        },
      ),
    );
  }
}
