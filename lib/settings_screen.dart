import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final bool isDarkMode;
  final void Function(bool) onThemeChanged;
  final bool dummyPref;
  final void Function(bool)? onDummyPrefChanged;

  const SettingsScreen({Key? key, required this.isDarkMode, required this.onThemeChanged, this.dummyPref = false, this.onDummyPrefChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Dark Theme'),
            value: isDarkMode,
            onChanged: onThemeChanged,
          ),
          SwitchListTile(
            title: Text('Dummy Preference'),
            value: dummyPref,
            onChanged: onDummyPrefChanged,
          ),
        ],
      ),
    );
  }
} 