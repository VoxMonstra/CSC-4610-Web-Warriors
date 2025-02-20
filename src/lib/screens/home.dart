import 'package:flutter/material.dart';
import 'package:src/widgets/bottom_nav_bar.dart';
import 'package:src/widgets/home_button.dart';
import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3CCB0), // Light brown background
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xFF7B421D),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
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
            SizedBox(height: 50),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome [name]',
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
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFF5E6D3), // Very light brown
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Order',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        SizedBox(height: 20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                4,
                                (index) => Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: _buildOrderBox(context, index))
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFF5E6D3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Order History',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        SizedBox(height: 20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                4,
                                (index) => Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: _buildOrderBox(context, index + 4))
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currPage: Text('home')),
      floatingActionButton: HomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildOrderBox(BuildContext context, int index) {
    List<IconData> icons = [
      Icons.bakery_dining,
      Icons.fastfood,
      Icons.local_pizza,
      Icons.local_cafe,
      Icons.history,
      Icons.receipt,
      Icons.assignment,
      Icons.done_all
    ];
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Icon(icons[index], size: 50, color: Colors.grey),
        ),
      ),
    );
  }
}
