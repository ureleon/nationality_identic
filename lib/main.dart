import 'package:flutter/material.dart';
import 'package:national_identic/main_page.dart';
import 'package:national_identic/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(final BuildContext context) {
    /*    final MediaQueryData queryData = MediaQuery.of(
      context,
    ); // тут операнда с размером экрана */
    return MaterialApp(
      title: 'Nationalic',
      initialRoute: '/home',
      routes: <String, WidgetBuilder>{
        '/home': (final BuildContext context) => const MainPage(),
        '/settings': (final BuildContext context) => const SettingsPage(),
      },
    );
  }
}
