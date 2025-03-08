import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saathi/screens/login_screen.dart';
import '../providers/theme_provider.dart';
import '../components/drawer_component.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      drawer: DrawerComponent(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            SwitchListTile(
              title: Text('Dark Mode'),
              value: themeProvider.themeMode == ThemeMode.dark,
              onChanged: (bool value) {
                themeProvider.toggleTheme(
                  value ? ThemeMode.dark : ThemeMode.light,
                );
              },
            ),
            Divider(),
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: true, // Replace with actual value from your settings
              onChanged: (bool value) {
                // Handle notifications toggle
              },
            ),
            Divider(),
            ListTile(
              title: Text('Account Settings'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Account Settings
              },
            ),
            Divider(),
            ListTile(
              title: Text('Help & About'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Help & About
              },
            ),
            Divider(),
            ListTile(
              title: Text('Logout'),
              trailing: Icon(Icons.logout),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
                // Handle logout
              },
            ),
          ],
        ),
      ),
    );
  }
}
