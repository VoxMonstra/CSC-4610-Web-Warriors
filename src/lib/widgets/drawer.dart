import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AppDrawer extends StatelessWidget {
  final Text currPage;
  AppDrawer({super.key, required this.currPage});
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFE3CCB0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF7B421D)),
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
                leading: Icon(Icons.inventory, color: Colors.black),
                textColor: Colors.black,
                title: Text('Inventory'),
                onTap: () {
                  Navigator.pushNamed(context, '/inventory');
                },
              ),
            if (currPage.data != "recipes")
              ListTile(
                leading: Icon(Icons.inventory, color: Colors.black),
                textColor: Colors.black,
                title: Text('Recipes'),
                onTap: () {
                  Navigator.pushNamed(context, '/recipes');
                },
              ),
            if (currPage.data != "about")
              ListTile(
                leading: Icon(Icons.info, color: Colors.black),
                textColor: Colors.black,
                title: Text('About'),
                onTap: () {
                  Navigator.pushNamed(context, '/about');
                },
              ),
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
      ),
    );
  }
}
