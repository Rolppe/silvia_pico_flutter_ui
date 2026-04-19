import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silvia_pico_ui/core/providers.dart';

// ============================================================================
// VALUE DISPLAY WIDGET
// ============================================================================

class ValueDisplay extends ConsumerWidget {
  const ValueDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(machineDataProvider);
    final connected = ref.watch(bleNotifierProvider);

    return Column(
      children: [
        _ValueRow(label: 'Temperature', value: '${data.boilerTemperature.toStringAsFixed(1)}°C', color: Colors.red),
        _ValueRow(label: 'Pressure', value: '${data.boilerPressure.toStringAsFixed(1)} bar', color: Colors.blue),
        _ValueRow(label: 'Pump ratio', value: '${data.pumpRatio.toStringAsFixed(1)}%', color: Colors.cyan),
        _ValueRow(label: 'Brew Timer', value: '${data.brewTimer} s', color: Colors.orange),
        Text(
          'Bluetooth: ${connected ? "connected" : "disconnected"}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: connected ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
}

class _ValueRow extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _ValueRow({
//    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelSmall),
        Text(
          value,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    ),
  );
}