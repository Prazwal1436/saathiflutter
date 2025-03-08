import 'package:flutter/material.dart';
import '../components/drawer_component.dart';
import '../components/logo_component.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: DrawerComponent(),
      body: Center(child: LogoComponent(width: 350, height: 350)),
    );
  }
}
