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

            if (currPage.data != "menu")
            ListTile(
              leading: Icon(Icons.receipt),
              title: Text('Order'),
              onTap: () {
                Navigator.pushNamed(context, '/menu');
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

            if (currPage.data != "inventory")
              ListTile(
                leading: Icon(Icons.inventory),
                title: Text('Inventory'),
                onTap: () {
                  Navigator.pushNamed(context, '/inventory');
                },
              ),

            if (currPage.data != "about")
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About'),
                onTap: () {
                  Navigator.pushNamed(context, '/about');
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
