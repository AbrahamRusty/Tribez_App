// main.dart
import 'package:flutter/material.dart';

// Import semua screen
import 'screen/splashscreen.dart';
import 'screen/welcomescreen.dart';
import 'screen/loginscreen.dart';
import 'screen/registerscreen.dart';
import 'screen/resetpasswordscreen.dart';
import 'screen/homescreen.dart';
import 'screen/newsscreen.dart';
import 'screen/verificationscreen.dart';

void main() {
  runApp(const TribezApp());
}

class TribezApp extends StatelessWidget {
  const TribezApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tribez',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/reset-password': (context) => const ForgotPasswordScreen(),
        '/home': (context) => const HomeScreen(),
        '/news': (context) => const NewsScreen(),
        '/verification': (context) => const VerificationScreen(),
        '/signup-success': (context) => const SignUpSuccessScreen(),
        '/business-profile': (context) => const BusinessProfileScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/verification-send': (context) => const VerificationSendScreen(),
        '/verification-loading': (context) => const VerificationLoadingScreen(),
        '/verification-success': (context) => const VerificationSuccessScreen(),
      },
    );
  }
}
