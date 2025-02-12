import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3CCB0), // Light brown background
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xFF212121),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50), // Moves content up
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome [name]', // Soon creating function to gather first and potentially last name and display them here
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile_picture.png'),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Order',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: List.generate(4, (index) => _buildOrderBox(context)),
                  ),
                  SizedBox(height: 30), // Space before Order History
                  Text(
                    'Order History',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: List.generate(4, (index) => _buildOrderBox(context)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF4E3D32), // Darker Brown as in wireframe
        shape: CircularNotchedRectangle(),
        notchMargin: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {}, // Placeholder action, don't know where to route it yet
            ),
            IconButton(
              icon: Icon(Icons.info, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        backgroundColor: Color(0xFF6B835C), // Lighter Green as in wireframe
        child: Icon(Icons.home),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildOrderBox(BuildContext context) {
    return GestureDetector(
      onTap: () {}, // Placeholder for routing of the order's and expected categories in the future
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Icon(Icons.image, size: 50, color: Colors.grey), // Maybe to have actual picture, or just icon per category
        ),
      ),
    );
  }
}










// FOr looking at later when home page shortly re-expanded again

//import 'package:flutter/material.dart';
//import '../widgets/drawer.dart';
//
//class HomePage extends StatelessWidget {
//  const HomePage({super.key});
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Home'),
//        backgroundColor: Color(0xFF0B3D02),
//        actions: [
//          IconButton(
//            icon: Icon(Icons.settings),
//            onPressed: () {
//              Navigator.pushNamed(context, '/settings');
//            },
//          ),
//        ],
//      ),
//      drawer: AppDrawer(currPage: Text('home')),
//      body: Container(
//        color: Color(0xFFD2B48C),
//        child: SingleChildScrollView(
//          child: Column(
//            children: [
//              Padding(
//                padding: EdgeInsets.all(16),
//                child: Center(
//                  child: Container(
//                    padding: EdgeInsets.all(16),
//                    decoration: BoxDecoration(
//                      color: Color(0xFF0B3D02),
//                      borderRadius: BorderRadius.circular(8),
//                    ),
//                    child: Text(
//                      'Welcome to Simple Bakery!',
//                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                        color: Colors.white, 
//                      ),
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.all(16),
//                child: Column(
//                  children: [
//                    _buildNavigationBox(
//                      context,
//                      title: 'Inventory',
//                      icon: Icons.inventory,
//                      onTap: () {
//                        Navigator.pushNamed(context, '/inventory');
//                      },
//                      color: Colors.white,
//                    ),
//                    SizedBox(height: 16),
//                    _buildNavigationBox(
//                      context,
//                      title: 'About',
//                      icon: Icons.info,
//                      onTap: () {
//                        Navigator.pushNamed(context, '/about');
//                      },
//                      color: Colors.white,
//                    ),
//                    SizedBox(height: 16),
//                    _buildNavigationBox(
//                      context,
//                      title: 'Settings',
//                      icon: Icons.settings,
//                      onTap: () {
//                        Navigator.pushNamed(context, '/settings');
//                      },
//                      color: Colors.white,
//                    ),
//                  ],
//                ),
//              ),
//              Container(
//                padding: EdgeInsets.all(16),
//                decoration: BoxDecoration(
//                  color: Color(0xFF0B3D02),
//                  borderRadius: BorderRadius.circular(8),
//                ),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: [
//                    Text(
//                      'About',
//                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                        color: Colors.white,
//                      ),
//                    ),
//                    SizedBox(height: 8),
//                    Text(
//                      'Simple Bakery is your go-to place for delicious baked goods.',
//                      style: TextStyle(fontSize: 14, color: Colors.white),
//                    ),
//                  ],
//                ),
//              ),
//              SizedBox(
//                height: 500,
//                child: Center(
//                  child: Text('More content here', style: TextStyle(color: Colors.white)),
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//  Widget _buildNavigationBox(
//    BuildContext context, {
//    required String title,
//    required IconData icon,
//    required VoidCallback onTap,
//    required Color color,
//  }) {
//    return GestureDetector(
//      onTap: onTap,
//      child: Container(
//        width: double.infinity,
//        padding: EdgeInsets.all(16),
//        decoration: BoxDecoration(
//          color: Color(0xFF0B3D02),
//          borderRadius: BorderRadius.circular(8),
//        ),
//        child: Row(
//          children: [
//            Icon(icon, size: 30, color: color),
//            SizedBox(width: 16),
//            Text(
//              title,
//              style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                    color: color,
//                  ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
