# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

National Identic is a Flutter app that predicts a person's nationality from their name using the [Nationalize.io](https://api.nationalize.io/) API. Users enter a name, the app fetches nationality probabilities, and displays results with country flags.

## Build & Run Commands

```bash
flutter pub get          # Install dependencies
flutter run              # Run on connected device/simulator
flutter build apk        # Build Android APK
flutter build ios        # Build iOS
flutter build macos      # Build macOS
flutter analyze          # Run static analysis (uses fl_common_lint)
dart format .            # Format code
```

No tests exist in the project currently.

## Architecture

- **`lib/main.dart`** — App entry point and `MyApp` root widget. Manages theme state via `SharedPreferences` and defines named routes (`/home`, `/settings`).
- **`lib/main_page.dart`** — Main screen with text input and drawer navigation. Delegates API output to `NatOutput`.
- **`lib/nationality_future_handler.dart`** — `NatOutput` widget that calls the Nationalize.io API via `FutureBuilder`, parses response into `Nationality` model, and renders result cards with flag emoji.
- **`lib/nationality.dart`** — Data models (`Nationality`, `Country`) with manual JSON serialization.
- **`lib/settings_page.dart`** — Settings screen with theme selector dropdown. Uses `SharedPreferencesWithCache` with legacy migration.
- **`lib/cards_example.dart`** — Reusable `Card`/`ListTile` widget factory.
- **`lib/theme_map.dart`** — `Map<int, ThemeMode>` mapping integer keys (1=system, 2=light, 3=dark) used for theme persistence.

## Key Dependencies

- `shared_preferences` — Theme persistence
- `http` — API calls to nationalize.io
- `flutter_emoji` — Country flag rendering
- `fl_common_lint` — Lint rules (analysis_options.yaml extends this package)

## Conventions

- Navigation uses named routes (`/home`, `/settings`) — there is a known TODO to migrate to a better routing approach (go_router branch exists).
- Theme preference is stored as an int key in SharedPreferences under the `'settings'` key.
- SDK constraint: Flutter >=3.41.0, Dart >=3.11.0.
