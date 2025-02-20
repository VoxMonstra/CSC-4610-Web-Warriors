import 'package:flutter/material.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preferences"),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        color: Color(0xFFE3CCB0),
        child: const Text("Customize your app preferences here.", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}