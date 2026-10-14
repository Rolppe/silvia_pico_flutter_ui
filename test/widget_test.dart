import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:silvia_pico_ui/core/providers.dart';
import 'package:silvia_pico_ui/features/data/machine_data_notifier.dart';
import 'package:silvia_pico_ui/features/ui/widgets/value_display.dart';
import 'package:silvia_pico_ui/models/machine_status.dart';

/// Returns a fixed state instead of listening to Bluetooth.
class _FixedMachineData extends MachineDataNotifier {
  _FixedMachineData(this._status);

  final MachineStatus _status;

  @override
  MachineStatus build() => _status;
}

void main() {
  testWidgets('ValueDisplay formats temperature, pressure and pump ratio', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          machineDataProvider.overrideWith(
            () => _FixedMachineData(
              const MachineStatus(boilerTemperature: 93.46, boilerPressure: 9.04, pumpRatio: 0.625),
            ),
          ),
        ],
        child: const MaterialApp(home: Scaffold(body: ValueDisplay())),
      ),
    );

    expect(find.text('Temperature'), findsOneWidget);
    expect(find.text('93.5°C'), findsOneWidget);
    expect(find.text('9.0 bar'), findsOneWidget);
    expect(find.text('63%'), findsOneWidget);
  });
}
