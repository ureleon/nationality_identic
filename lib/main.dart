import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:national_identic/routes.dart';
import 'package:national_identic/theme_controller.dart';
import 'package:national_identic/theme_map.dart' as theme_map;
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final ThemeMode themeModeFromCache =
      theme_map.themeMap[prefs.getInt('settings') ?? 1]!;
  runApp(MyApp(themeMode: themeModeFromCache));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.themeMode});

  final ThemeMode themeMode;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  late final GoRouter _router = GoRouter(
    routes: $appRoutes,
    initialLocation: '/',
  );

  @override
  void initState() {
    super.initState();
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final ThemeMode themeMode =
        theme_map.themeMap[prefs.getInt('settings') ?? 1]!;
    setState(() {
      _themeMode = themeMode;
    });
  }

  Future<void> _updateThemeMode(final int mode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('settings', mode);
    setState(() => _themeMode = theme_map.themeMap[mode]!);
  }

  @override
  Widget build(final BuildContext context) {
    return ThemeController(
      updateTheme: _updateThemeMode,
      child: MaterialApp.router(
        title: 'Nationalic',
        themeMode: _themeMode,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        routerConfig: _router,
      ),
    );
  }
}
