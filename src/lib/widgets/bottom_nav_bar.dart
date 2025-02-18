import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final Text currPage;
  const BottomNavBar({super.key, required this.currPage});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Color(0xFF7B421D),
        shape: null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/inventory');
              },
            ),
            IconButton(
              icon: Icon(Icons.receipt, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/menu');
              },
            ),
            IconButton(
              icon: Icon(Icons.info, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      );
  }
  }