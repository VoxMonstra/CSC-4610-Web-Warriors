import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final Text currPage;
  const AppDrawer({super.key, required this.currPage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),

          // Home button
          if (currPage.data != "home")
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),

          // Settings button
          if (currPage.data != "settings")
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),

          // Login button
          if (currPage.data != "login")
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Login'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
        ],
      ),
    );
  }
}
