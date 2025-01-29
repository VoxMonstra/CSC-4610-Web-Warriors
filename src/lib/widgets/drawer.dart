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
          if (currPage.data != "home")
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home'); // Change route if needed
              },
            ),
          if (currPage.data != "settings")
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          if (currPage.data != "login")
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
        ],
      ),
    );
  }
}
