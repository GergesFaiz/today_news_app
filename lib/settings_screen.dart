
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Language'),
            subtitle: const Text('English'),
            leading: const Icon(Icons.language),
            onTap: () {
              // TODO: Implement language selection
            },
          ),
        ],
      ),
    );
  }
}
