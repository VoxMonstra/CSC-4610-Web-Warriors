import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xFF0B3D02),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      drawer: AppDrawer(currPage: Text('home')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/gpt-generated-branding.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFF0B3D02),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Welcome to Simple Bakery!',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white, 
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildNavigationBox(
                      context,
                      title: 'Inventory',
                      icon: Icons.inventory,
                      onTap: () {
                        Navigator.pushNamed(context, '/inventory');
                      },
                      color: Colors.white,
                    ),
                    SizedBox(height: 16),
                    _buildNavigationBox(
                      context,
                      title: 'About',
                      icon: Icons.info,
                      onTap: () {
                        Navigator.pushNamed(context, '/about');
                      },
                      color: Colors.white,
                    ),
                    SizedBox(height: 16),
                    _buildNavigationBox(
                      context,
                      title: 'Settings',
                      icon: Icons.settings,
                      onTap: () {
                        Navigator.pushNamed(context, '/settings');
                      },
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF0B3D02),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Simple Bakery is your go-to place for delicious baked goods.',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 500,
                child: Center(
                  child: Text('More content here', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationBox(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFF0B3D02),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, size: 30, color: color),
            SizedBox(width: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: color,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}