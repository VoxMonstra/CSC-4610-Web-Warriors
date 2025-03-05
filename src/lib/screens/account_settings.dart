import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  _AccountSettingsScreenState createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  Color _backgroundColor = const Color(0xFFE3CCB0);
  double _textSize = 16.0;
  String _notificationFrequency = "Daily";

  void _changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Settings", style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFF7B421D),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: _backgroundColor,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Manage your account settings here.",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 20),

            // Background Color Setting
            const Text("Change Background Color:", 
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
            DropdownButton<Color>(
              value: _backgroundColor,
              dropdownColor: Colors.white,
              iconEnabledColor: Colors.black,
              items: const [
                DropdownMenuItem(value: Color(0xFFE3CCB0), child: Text("Beige", style: TextStyle(color: Colors.black))),
                DropdownMenuItem(value: Colors.white, child: Text("White", style: TextStyle(color: Colors.black))),
                DropdownMenuItem(value: Colors.grey, child: Text("Gray", style: TextStyle(color: Colors.black))),
                DropdownMenuItem(value: Colors.lightBlue, child: Text("Light Blue", style: TextStyle(color: Colors.black))),
                DropdownMenuItem(value: Colors.greenAccent, child: Text("Green Accent", style: TextStyle(color: Colors.black))),
              ],
              onChanged: (Color? newColor) {
                if (newColor != null) {
                  _changeBackgroundColor(newColor);
                }
              },
            ),
            const SizedBox(height: 20),

            // Text Size Adjustment
            const Text("Text Size:", 
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
            Slider(
              value: _textSize,
              min: 12,
              max: 24,
              divisions: 6,
              label: _textSize.toString(),
              activeColor: Colors.white,
              inactiveColor: Colors.white,
              onChanged: (double value) {
                setState(() {
                  _textSize = value;
                });
              },
            ),
            Center(
              child: Text(
                _textSize.toString(),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            // Notification Frequency
            const Text("Notification Frequency:", 
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
            DropdownButton<String>(
              value: _notificationFrequency,
              dropdownColor: Colors.white,
              iconEnabledColor: Colors.black,
              items: const [
                DropdownMenuItem(value: "Never", child: Text("Never", style: TextStyle(color: Colors.black))),
                DropdownMenuItem(value: "Daily", child: Text("Daily", style: TextStyle(color: Colors.black))),
                DropdownMenuItem(value: "Weekly", child: Text("Weekly", style: TextStyle(color: Colors.black))),
                DropdownMenuItem(value: "Monthly", child: Text("Monthly", style: TextStyle(color: Colors.black))),
              ],
              onChanged: (String? newFrequency) {
                if (newFrequency != null) {
                  setState(() {
                    _notificationFrequency = newFrequency;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
