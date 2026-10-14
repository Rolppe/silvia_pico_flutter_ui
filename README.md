# silvia_pico_flutter_ui

[![CI](https://github.com/Rolppe/silvia_pico_flutter_ui/actions/workflows/ci.yml/badge.svg)](https://github.com/Rolppe/silvia_pico_flutter_ui/actions/workflows/ci.yml)

Flutter UI for EspressoPico, a Raspberry Pi Pico controller for a Rancilio Silvia espresso machine.
The app connects to the controller over Bluetooth LE and shows boiler temperature, pressure and pump
ratio with real-time graphs. The code was written with AI assistance.

- State: Riverpod (`lib/core/providers.dart`), immutable models with freezed (`lib/models/`)
- Bluetooth: flutter_blue_plus (`lib/features/ble/`)
- Graphs: fl_chart (`lib/features/ui/widgets/graph_widget.dart`)

## Development

```sh
flutter pub get
flutter analyze
flutter test
```

CI runs the same three commands on GitHub Actions for every push to `master` and every pull request.
