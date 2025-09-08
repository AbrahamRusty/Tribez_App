import 'package:flutter/material.dart';

// Import semua screen
import 'screen/splashscreen.dart';
import 'screen/welcomescreen.dart';
import 'screen/loginscreen.dart';
import 'screen/registerscreen.dart';
import 'screen/forgotpasswordscreen.dart';
import 'screen/verificationscreen.dart' as verification;
import 'screen/resetpasswordscreen.dart';


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
        '/register': (context) => RegisterScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
        '/verification': (context) => const verification.VerificationScreen(),
        '/reset-password': (context) => ResetPasswordScreen(),
      },
    );
  }
}
