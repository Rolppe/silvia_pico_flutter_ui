import 'package:silvia_pico_ui/core/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ============================================================================
// VALUE DISPLAY WIDGET
// ============================================================================

class ValueDisplay extends ConsumerWidget {
  const ValueDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(machineDataProvider);
//    final connected = ref.watch(bleNotifierProvider);

    return Column(
      children: [
        _ValueRow(label: 'Temperature', value: '${data.boilerTemperature.toStringAsFixed(1)}°C', color: Colors.red),
        _ValueRow(label: 'Pressure', value: '${data.boilerPressure.toStringAsFixed(1)} bar', color: Colors.blue),
        _ValueRow(label: 'Pump', value: '${(data.pumpRatio * 100).toStringAsFixed(0)}%', color: Colors.orange),
      ],
    );
  }
}

class _ValueRow extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _ValueRow({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
