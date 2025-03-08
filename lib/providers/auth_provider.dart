// filepath: c:\Users\skill\Desktop\saathi\lib\providers\auth_provider.dart
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }

  Future<void> checkLoginStatus() async {
    // Replace with your actual login status check logic
    // For example, check from shared preferences or a secure storage
    _isLoggedIn = false; // Example: set to false if not logged in
    notifyListeners();
  }
}
