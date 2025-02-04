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
                  style: Theme.of(context).textTheme.headlineMedium, // Theme text
                ),
              ),
            ),

            // About section at the bottom
            Container(
              padding: EdgeInsets.all(16),
              color: Theme.of(context).colorScheme.surface, // Adapts to the theme
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: Theme.of(context).textTheme.titleMedium,
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