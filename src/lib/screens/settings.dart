import 'package:flutter/material.dart';
import 'package:src/services/auth_service.dart';
import 'account_settings.dart';
import 'preferences.dart';
import 'profile_settings.dart';
import '../widgets/drawer.dart';

class SettingsScreen extends StatefulWidget {
  final Function(ThemeMode) onThemeChanged;

  const SettingsScreen({Key? key, required this.onThemeChanged}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  ThemeMode _themeMode = ThemeMode.system;

  void _changeTheme(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });

    widget.onThemeChanged(mode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFF7B421D),
      ),
      drawer: AppDrawer(currPage: const Text("settings")),
      body: Container(
        color: Color(0xFFE3CCB0),
        child: ListView(
          children: [
            SwitchListTile(
              title: const Text('Enable Notifications', style: TextStyle(color: Colors.black)),
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            ListTile(
              title: const Text('Theme', style: TextStyle(color: Colors.black)),
              subtitle: Text(
                _themeMode == ThemeMode.light
                    ? 'Light'
                    : _themeMode == ThemeMode.dark
                        ? 'Dark'
                        : 'System Default',
                style: const TextStyle(color: Colors.black),
              ),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text('Light Mode'),
                          onTap: () {
                            _changeTheme(ThemeMode.light);
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text('Dark Mode',
                          ),
                          onTap: () {
                            _changeTheme(ThemeMode.dark);
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text('System Default',
                          ),
                          onTap: () {
                            _changeTheme(ThemeMode.system);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const Divider(color: Colors.black),

            ListTile(
              title: const Text('Account Settings', style: TextStyle(color: Colors.black)),
              leading: const Icon(Icons.account_circle, color: Colors.black),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettingsScreen()));
              },
            ),

            ListTile(
              title: const Text('Profile Settings', style: TextStyle(color: Colors.black)),
              leading: const Icon(Icons.person, color: Colors.black),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileSettingsScreen()));
              },
            ),

            ListTile(
              title: const Text('Preferences', style: TextStyle(color: Colors.black)),
              leading: const Icon(Icons.settings, color: Colors.black),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PreferencesScreen()));
              },
            ),

            ListTile(
              title: const Text('Logout', style: TextStyle(color: Colors.black)),
              leading: const Icon(Icons.logout, color: Colors.red),
              onTap: () {
                _logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                print("Logout button pressed");
                await AuthService().logout();
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text("Logout", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
