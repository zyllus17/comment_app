import 'package:comment_app/constants/routes.const.dart';
import 'package:comment_app/constants/theme.const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:comment_app/firebase_options.dart';
import 'package:comment_app/services/auth.service.dart';
import 'package:comment_app/services/loading.dart';
import 'package:firebase_core/firebase_core.dart';

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
        theme: AppTheme.appTheme,
        initialRoute: '/',
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
