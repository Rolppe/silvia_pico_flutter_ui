import '../../../core/providers.dart';
// ============================================================================
// landscape_layout.dart
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import '../../data/machine_data_notifier.dart';
//import '../../ble/ble_notifier.dart';
import '../widgets/graph_widget.dart';

// ============================================================================
// LANDSCAPE LAYOUT
// ============================================================================

class LandscapeLayout extends ConsumerWidget {
  const LandscapeLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(machineDataProvider);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text('Temperature', style: Theme.of(context).textTheme.labelSmall),
                    Text('${data.boilerTemperature.toStringAsFixed(1)}°C',
                        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.red)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text('Pressure (bar)', style: Theme.of(context).textTheme.labelSmall),
                    Text(data.boilerPressure.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blue)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text('Pump ratio', style: Theme.of(context).textTheme.labelSmall),
                    Text('${data.pumpRatio.toStringAsFixed(1)}%',
                        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.cyan)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text('Brew Timer', style: Theme.of(context).textTheme.labelSmall),
                    Text('${data.brewTimer} s',
                        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, fontFamily: 'monospace', color: Colors.orange)),
                  ],
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () => data.isGraphPaused
                    ? ref.read(machineDataProvider.notifier).resetGraphForNewSession()
                    : ref.read(machineDataProvider.notifier).pauseGraph(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                child: Text(data.isGraphPaused ? 'Draw Graph' : 'Freeze Graph'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: GraphWidget(
              temperatureData: data.temperatureData,
              pressureData: data.pressureData,
              currentTime: data.currentTime,
            ),
          ),
        ],
      ),
    );
  }
}
