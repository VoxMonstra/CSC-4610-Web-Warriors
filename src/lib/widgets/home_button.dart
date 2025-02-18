import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/home');
      },
      backgroundColor: Color(0xFF6B835C),
      shape: CircleBorder(),
        child: Image.asset(
          'assets/newlogoTransparent.png',
          fit: BoxFit.cover,
          width: 40,
          height: 40,
        ),
    );
  }
}
