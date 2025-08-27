// TODO(uleon): improve architecture, repair logic. Need more regular methods if i call this right

import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:national_identic/theme_map.dart' as theme_map;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/util/legacy_to_async_migration_util.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key, required this.updateTheme});
  final void Function(int) updateTheme;

  @override
  Widget build(final BuildContext context) {
    return PreferencesState(updateTheme: updateTheme);
  }
}

class PreferencesState extends StatefulWidget {
  const PreferencesState({super.key, required this.updateTheme});
  final void Function(int) updateTheme;
  @override
  State<PreferencesState> createState() => _PreferencesStateState();
}

class _PreferencesStateState extends State<PreferencesState> {
  final Future<SharedPreferencesWithCache> _prefs =
      SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions(
          allowList: <String>{'settings'},
        ),
      );
  late Future<int> _theme;
  final Completer<void> _preferencesReady = Completer<void>();

  Future<void> _migratePreferences() async {
    // #docregion migrate
    const SharedPreferencesOptions sharedPreferencesOptions =
        SharedPreferencesOptions();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await migrateLegacySharedPreferencesToSharedPreferencesAsyncIfNecessary(
      legacySharedPreferencesInstance: prefs,
      sharedPreferencesAsyncOptions: sharedPreferencesOptions,
      migrationCompletedKey: 'migrationCompleted',
    );
    // #enddocregion migrate
  }

  @override
  void initState() {
    super.initState();
    _migratePreferences().then((_) {
      _theme = _prefs.then((final SharedPreferencesWithCache prefs) {
        return prefs.getInt('settings') ?? 0;
      });

      _preferencesReady.complete();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(final BuildContext context) {
    return PopScope(
      child: MaterialApp(
        theme: Theme.of(context),
        darkTheme: Theme.of(context),
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
          body: Column(
            children: <Widget>[
              _WaitForInitialization(
                initialized: _preferencesReady.future,
                builder: (final BuildContext context) => FutureBuilder<int>(
                  future: _theme,
                  builder:
                      (
                        final BuildContext context,
                        final AsyncSnapshot<int> snapshot,
                      ) {
                        didChangeDependencies();
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            throw Exception('Settings is not here for now');
                          case ConnectionState.waiting:
                            return const CircularProgressIndicator(
                              color: Colors.redAccent,
                            );
                          case ConnectionState.active:
                            throw Exception('settings is loading');
                          case ConnectionState.done:
                            if (snapshot.hasError) {
                              return Text(
                                'snasphot has error: ${snapshot.error}',
                              );
                            } else {
                              return Column(
                                children: <Widget>[
                                  DropdownMenu<ModeLabel>(
                                    enableSearch: false,
                                    requestFocusOnTap: false,
                                    leadingIcon: const Icon(
                                      Icons.accessibility_new_rounded,
                                    ),
                                    label: const Text('Theme'),
                                    onSelected: (final ModeLabel? number) =>
                                        widget.updateTheme(number!.number),
                                    dropdownMenuEntries: ModeLabel.entries,
                                  ),
                                ],
                              );
                            }
                        }
                      },
                ),
              ),
              Text('Current Theme is ${theme_map.themeMap[1]}'),
            ],
          ),
        ),
      ),
    );
  }
}

class _WaitForInitialization extends StatelessWidget {
  const _WaitForInitialization({
    required this.initialized,
    required this.builder,
  });

  final Future<void> initialized;
  final WidgetBuilder builder;

  @override
  Widget build(final BuildContext context) {
    return FutureBuilder<void>(
      future: initialized,
      builder:
          (final BuildContext context, final AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.none) {
              return const CircularProgressIndicator();
            }
            return builder(context);
          },
    );
  }
}

typedef ModeEntry = DropdownMenuEntry<ModeLabel>;

// DropdownMenuEntry labels and values for the first dropdown menu.
enum ModeLabel {
  system('System Theme', 1),
  light('Light Theme', 2),
  dark('Dark Theme', 3);

  const ModeLabel(this.label, this.number);
  final String label;
  final int number;

  static final List<ModeEntry> entries = UnmodifiableListView<ModeEntry>(
    values.map<ModeEntry>(
      (final ModeLabel number) => ModeEntry(value: number, label: number.label),
    ),
  );
}
