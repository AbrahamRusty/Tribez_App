import 'package:flutter/material.dart';
import 'welcomescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFDE59), // kuning
      body: Center(
        child: Image.asset(
          'assets/tribezlogo.png', // taruh logo TR#BEZ di folder assets
          width: 200,
        ),
      ),
    );
  }
}
