import 'package:flutter/material.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Settings"),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        color: Color(0xFFE3CCB0),
        child: const Text("Update your profile information here.", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}