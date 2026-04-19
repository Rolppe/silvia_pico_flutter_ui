import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
//import '../../ble/ble_notifier.dart';

// ============================================================================
// CONTROLS WIDGET – Korjattu versio
// ============================================================================

class ControlsWidget extends ConsumerWidget {
  const ControlsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(machineDataProvider);
    final ble = ref.read(bleNotifierProvider.notifier);

    return Column(
      children: [
        SwitchListTile(
          title: const Text('Pre-infusion'),
          value: data.preInfusionOn,
          onChanged: (val) => ble.sendCommand('pre:${val ? "on" : "off"}'),
          activeColor: Colors.green,
        ),
        SwitchListTile(
          title: const Text('Soft pressure release'),
          value: data.softPressureReleaseOn,
          onChanged: (val) => ble.sendCommand('spr:${val ? "on" : "off"}'),
          activeColor: Colors.green,
        ),
        SwitchListTile(
          title: const Text('Fast heatup'),
          value: data.fastHeatupOn,
          onChanged: (val) => ble.sendCommand('fhu:${val ? "on" : "off"}'),
          activeColor: Colors.green,
        ),

        // BREW TEMPERATURE SÄÄDIN – NYT TOIMII
        ListTile(
          title: const Text('Brew temperature'),
          subtitle: Slider(
            value: data.brewTemperature.clamp(88.0, 106.0),
            min: 92,
            max: 106,
            divisions: 14,
            label: '${data.brewTemperature.toStringAsFixed(1)}°C',
            onChanged: (val) {
              // Lähetetään komento heti kun käyttäjä vetää
              ble.sendCommand('bt:${val.toStringAsFixed(1)}');
            },
          ),
          trailing: Text(
            '${data.brewTemperature.toStringAsFixed(1)}°C',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}