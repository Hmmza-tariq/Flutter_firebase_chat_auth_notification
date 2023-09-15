import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_example/firebase.dart';
import 'package:firebase_example/login_screen.dart';
import 'package:firebase_example/welcome_screen.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
      navigatorKey: navigatorKey,
      routes: {'/login_screen': (context) => const LoginScreen()},
    );
  }
}
