import 'package:flutter/material.dart';
import 'package:saathi/components/drawer_component.dart';

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact Us')),
      drawer: DrawerComponent(), // Add the drawer here
      body: Center(
        child: Text('Contact Us Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
