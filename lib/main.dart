import 'package:flutter/material.dart';
import 'splash.dart'; // Updated import

void main() {
  runApp(PawGuardApp());
}

class PawGuardApp extends StatelessWidget {
  const PawGuardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PawGuard',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(), // Display the SplashScreen first
      debugShowCheckedModeBanner: false, // To hide the debug banner
    );
  }
}
