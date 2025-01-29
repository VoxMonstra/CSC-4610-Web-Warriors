import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: AppDrawer(currPage: Text('home')),
      body: const Center(
        child: Text('Welcome to Simple Bakery!'),
      ),
    );
  }
}
