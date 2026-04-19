import '../../../core/providers.dart';
// ============================================================================
// portrait_layout.dart
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/value_display.dart';
import '../widgets/controls_widget.dart';
import '../widgets/graph_widget.dart';
//import '../../data/machine_data_notifier.dart';
//import '../../ble/ble_notifier.dart';

// ============================================================================
// PORTRAIT LAYOUT
// ============================================================================

class PortraitLayout extends ConsumerWidget {
  const PortraitLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(machineDataProvider);
    final isConnected = ref.watch(bleNotifierProvider);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Bluetooth'),
                const SizedBox(width: 8),
                Icon(Icons.bluetooth, color: isConnected ? Colors.green : Colors.red),
              ],
            ),
            const SizedBox(height: 24),
            const ValueDisplay(),
            const SizedBox(height: 24),
            const ControlsWidget(),
            const SizedBox(height: 32),
            GraphWidget(
              temperatureData: data.temperatureData,
              pressureData: data.pressureData,
              currentTime: data.currentTime,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => data.isGraphPaused
                  ? ref.read(machineDataProvider.notifier).resetGraphForNewSession()
                  : ref.read(machineDataProvider.notifier).pauseGraph(),
              child: Text(data.isGraphPaused ? 'Draw Graph' : 'Freeze Graph'),
            ),
          ],
        ),
      ),
    );
  }
}
