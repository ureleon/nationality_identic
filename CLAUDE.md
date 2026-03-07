# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

National Identic is a Flutter app that predicts a person's nationality from their name using the [Nationalize.io](https://api.nationalize.io/) API. Users enter a name, the app fetches nationality probabilities, and displays results with country flags.

## Build & Run Commands

```bash
flutter pub get          # Install dependencies
dart run build_runner build --delete-conflicting-outputs  # Generate routes (*.g.dart)
flutter run              # Run on connected device/simulator
flutter build apk        # Build Android APK
flutter build ios        # Build iOS
flutter build macos      # Build macOS
flutter analyze          # Run static analysis (uses fl_common_lint)
dart format .            # Format code
```

No tests exist in the project currently.

## Architecture

- **`lib/main.dart`** — App entry point and `MyApp` root widget. Manages theme state via `SharedPreferences`, wraps `MaterialApp.router` with `ThemeController`.
- **`lib/routes.dart`** — Type-safe route definitions using `go_router_builder` (`@TypedGoRoute` annotations). Generates `routes.g.dart` with `$appRoutes`.
- **`lib/theme_controller.dart`** — `InheritedWidget` exposing the `updateTheme` callback. Pages access it via `ThemeController.of(context)`.
- **`lib/main_page.dart`** — Main screen with text input and drawer navigation. Delegates API output to `NatOutput`.
- **`lib/nationality_future_handler.dart`** — `NatOutput` widget that calls the Nationalize.io API via `FutureBuilder`, parses response into `Nationality` model, and renders result cards with flag emoji.
- **`lib/nationality.dart`** — Data models (`Nationality`, `Country`) with manual JSON serialization.
- **`lib/settings_page.dart`** — Settings screen with theme selector dropdown. Uses `SharedPreferencesWithCache` with legacy migration.
- **`lib/cards_example.dart`** — Reusable `Card`/`ListTile` widget factory.
- **`lib/theme_map.dart`** — `Map<int, ThemeMode>` mapping integer keys (1=system, 2=light, 3=dark) used for theme persistence.

## Key Dependencies

- `go_router` — Declarative routing via `MaterialApp.router`
- `go_router_builder` (dev) — Code generation for type-safe routes (`@TypedGoRoute`, `GoRouteData`)
- `build_runner` (dev) — Code generation runner (`dart run build_runner build --delete-conflicting-outputs`)
- `shared_preferences` — Theme persistence
- `http` — API calls to nationalize.io
- `flutter_emoji` — Country flag rendering
- `fl_common_lint` — Lint rules (analysis_options.yaml extends this package)

## Conventions

- Routing uses `go_router` with type-safe generated routes via `go_router_builder`. Routes defined in `lib/routes.dart`, generated code in `lib/routes.g.dart` (gitignored). Run `dart run build_runner build --delete-conflicting-outputs` after modifying route definitions.
- Navigation uses `.go()` (replaces stack). Type-safe: `const SettingsRoute().go(context)`.
- Theme preference is stored as an int key in SharedPreferences under the `'settings'` key.
- SDK constraint: Flutter >=3.41.0, Dart >=3.11.0.
