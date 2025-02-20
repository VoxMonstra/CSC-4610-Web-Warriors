import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  _AccountSettingsScreenState createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  Color _backgroundColor = const Color(0xFFE3CCB0); // Default background color

  void _changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Settings"),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        color: _backgroundColor, // Background color updates dynamically
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Manage your account settings here.",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text("Change Background Color:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            DropdownButton<Color>(
              value: _backgroundColor,
              items: const [
                DropdownMenuItem(value: Color(0xFFE3CCB0), child: Text("Beige")),
                DropdownMenuItem(value: Colors.white, child: Text("White")),
                DropdownMenuItem(value: Colors.grey, child: Text("Gray")),
                DropdownMenuItem(value: Colors.lightBlue, child: Text("Light Blue")),
                DropdownMenuItem(value: Colors.greenAccent, child: Text("Green Accent")),
              ],
              onChanged: (Color? newColor) {
                if (newColor != null) {
                  _changeBackgroundColor(newColor);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
