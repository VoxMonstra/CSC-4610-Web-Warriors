import 'package:flutter/material.dart';
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

    widget.onThemeChanged(mode); // ✅ Call function to update global theme
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'),
      iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: AppDrawer(currPage: Text("settings")),
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
            subtitle: Text(
              _themeMode == ThemeMode.light
                  ? 'Light'
                  : _themeMode == ThemeMode.dark
                      ? 'Dark'
                      : 'System Default',
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
                          _changeTheme(ThemeMode.light); // ✅ Apply change globally
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text('Dark Mode'),
                        onTap: () {
                          _changeTheme(ThemeMode.dark); // ✅ Apply change globally
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text('System Default'),
                        onTap: () {
                          _changeTheme(ThemeMode.system); // ✅ Apply change globally
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
