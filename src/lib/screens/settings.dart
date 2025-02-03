import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Enable Notifications'),
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          ListTile(
            title: const Text('Theme'),
            subtitle: Text(_themeMode == ThemeMode.light
                ? 'Light'
                : _themeMode == ThemeMode.dark
                    ? 'Dark'
                    : 'System Default'),
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
                        title: const Text('Dark Mode'),
                        onTap: () {
                          _changeTheme(ThemeMode.dark);
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text('System Default'),
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
        ],
      ),
    );
  }
}
