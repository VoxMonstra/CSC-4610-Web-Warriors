import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      drawer: AppDrawer(),
      body: const Center(
        child: Text('Welcome to the Dashboard!'),
      ),
    );
  }
}
