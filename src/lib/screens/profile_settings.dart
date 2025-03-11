import 'package:flutter/material.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Settings"),
        backgroundColor: Color(0xFF7B421D),
      ),
      body: Container(
        color: const Color(0xFFE3CCB0),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "Profile Picture" aka bread icon
            Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.bakery_dining,
                    size: 100,
                    color: Colors.brown,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Profile Information
            const Text(
              "Profile Information",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, 
              ),
            ),
            const SizedBox(height: 10),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(color: Colors.black), 
                      border: OutlineInputBorder(), 
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.black), 
                      border: OutlineInputBorder(), 
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Save Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // No real save functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  "Save Changes",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white, // Set text color to black
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Additional Settings Section
            const Text(
              "Additional Settings",
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ListTile(
                    leading: const Icon(Icons.notifications, color: Colors.black),
                    title: const Text(
                      "Notification Settings",
                      style: TextStyle(color: Colors.black), // Set text color to black
                    ),
                    onTap: () {
                      // No way to send notifications, just for show.
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.privacy_tip, color: Colors.black),
                    title: const Text(
                      "Privacy Settings",
                      style: TextStyle(color: Colors.black), // Set text color to black
                    ),
                    onTap: () {
                      // Add functionality for privacy settings
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}