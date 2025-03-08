import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _name = "Prajjwal Parajuli";
  String _phoneNumber = "Phone Number";

  String get name => _name;
  String get phoneNumber => _phoneNumber;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }
}
