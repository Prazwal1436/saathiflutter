// filepath: c:\Users\skill\Desktop\saathi\lib\screens\splash_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saathi/components/custom_text.dart';
import 'package:saathi/screens/login_screen.dart';
import 'dart:async';
import 'home_screen.dart';
import '../components/logo_component.dart';
import '../providers/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 2)); // Show splash for 2 seconds
    await Provider.of<AuthProvider>(
      context,
      listen: false,
    ).checkLoginStatus(); // Check login status
    bool isLoggedIn =
        Provider.of<AuthProvider>(context, listen: false).isLoggedIn;
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => isLoggedIn ? HomeScreen() : LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LogoComponent(height: 250, width: 250),
                  SizedBox(height: 20),
                  CircularProgressIndicator(color: Colors.white),
                ],
              ),
            ),
            SizedBox(height: 20),
            CustomText(text: "Powered by", color: Theme.of(context).cardColor),
            CustomText(
              text: "A.One Skills Tech Solutions",
              color: Theme.of(context).cardColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
