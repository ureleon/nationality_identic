import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return PopScope(
      child: MaterialApp(
        title: 'Settings',
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            title: const Text('Settings page'),
          ),
          body: Container(
            padding: const EdgeInsets.all(5),
            child: const Column(
              children: <Widget>[
                SizedBox(height: 15),
                Text('Here will be switches, soon, not now'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
