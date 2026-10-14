import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:silvia_pico_ui/models/data_point.dart';
import 'package:silvia_pico_ui/models/machine_status.dart';

void main() {
  group('MachineStatus', () {
    test('defaults describe an idle machine', () {
      const status = MachineStatus();
      expect(status.brewMode, 'IDLE');
      expect(status.brewTemperature, 97.0);
      expect(status.brewTimer, 0);
      expect(status.isGraphPaused, isFalse);
      expect(status.temperatureData, isEmpty);
      expect(status.pressureData, isEmpty);
    });

    test('copyWith changes only the given fields', () {
      const status = MachineStatus();
      final updated = status.copyWith(boilerTemperature: 93.5, brewMode: 'brew loop');
      expect(updated.boilerTemperature, 93.5);
      expect(updated.brewMode, 'brew loop');
      expect(updated.boilerPressure, status.boilerPressure);
      expect(updated, isNot(equals(status)));
    });

    test('fromJson fills missing keys with defaults', () {
      final status = MachineStatus.fromJson({'boilerTemperature': 90, 'brewTimer': 12});
      expect(status.boilerTemperature, 90.0);
      expect(status.brewTimer, 12);
      expect(status.brewMode, 'IDLE');
      expect(status.brewTemperature, 97.0);
    });

    test('survives a JSON round trip with graph data', () {
      const status = MachineStatus(
        boilerTemperature: 94.2,
        boilerPressure: 8.9,
        pumpRatio: 0.75,
        brewMode: 'pre-infusion main',
        temperatureData: [DataPoint(time: 0, value: 94.2), DataPoint(time: 0.5, value: 94.4)],
        pressureData: [DataPoint(time: 0, value: 8.9)],
      );
      final decoded = jsonDecode(jsonEncode(status.toJson())) as Map<String, dynamic>;
      expect(MachineStatus.fromJson(decoded), status);
    });
  });

  group('DataPoint', () {
    test('equal values are equal', () {
      expect(const DataPoint(time: 1, value: 2), const DataPoint(time: 1, value: 2));
    });

    test('JSON round trip', () {
      const point = DataPoint(time: 3.5, value: 9.1);
      expect(DataPoint.fromJson(point.toJson()), point);
    });
  });
}
