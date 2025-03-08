import 'package:flutter/material.dart';
import 'package:saathi/components/drawer_component.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Us')),
      drawer: DrawerComponent(), // Add the drawer here
      body: Center(
        child: Text('About Us Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
