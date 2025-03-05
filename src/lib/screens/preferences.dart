import 'package:flutter/material.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preferences", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF7B421D),
      ),
      body: Container(
        color: Color(0xFFE3CCB0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Customize your app preferences here.", style: TextStyle(fontSize: 18, color: Colors.black)),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Volume Level", style: TextStyle(fontSize: 16, color: Colors.black)),
                Slider(
                  value: 0.5,
                  onChanged: (double value) {
                  },
                  activeColor: Colors.black,
                  inactiveColor: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.language, color: Colors.black),
                SizedBox(width: 10),
                Text("App Language", style: TextStyle(fontSize: 16, color: Colors.black)),
                Spacer(),
                DropdownButton<String>(
                  value: 'English',
                  onChanged: (String? newValue) {
                  },
                  dropdownColor: Color(0xFFE3CCB0), 
                  items: <String>['English', 'Spanish', 'French', 'German']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: Colors.black)),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: IconButton(
                icon: Icon(Icons.save, color: Colors.black),
                onPressed: () {
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}