import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: AppDrawer(currPage: Text('home')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Main content
            Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'Welcome to Simple Bakery!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // About section at the bottom
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Simple Bakery is your go-to place for delicious baked goods. ',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            //Add more content here in order to keep scrolling
            SizedBox(height: 500, child: Center(child:Text('More content here')))
          ],
        ),
      ),
    );
  }
}