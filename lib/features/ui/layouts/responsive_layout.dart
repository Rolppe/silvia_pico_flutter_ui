import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers.dart';
import '../../../models/machine_status.dart';
import '../widgets/value_display.dart';
import '../widgets/controls_widget.dart';
import '../widgets/graph_widget.dart';

// ============================================================================
// RESPONSIVE LAYOUT - VERY STRICT VERSION
// ============================================================================

class ResponsiveLayout extends ConsumerWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(machineDataProvider);
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: isLandscape
          ? _landscape(data)
          : _portrait(data),
    );
  }

  // Pysty
  Widget _portrait(MachineStatus data) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: ValueDisplay()),
            Expanded(child: ValueDisplay()),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: GraphWidget(
            temperatureData: data.temperatureData,
            pressureData: data.pressureData,
            currentTime: data.currentTime,
          ),
        ),
        const SizedBox(height: 20),
        ControlsWidget(),
      ],
    );
  }

  // Vaaka - TIUKKA VERSIO
  Widget _landscape(MachineStatus data) {
    return Row(
      children: [
        // Vasen puoli (kapea)
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: ValueDisplay()),
                  Expanded(child: ValueDisplay()),
                ],
              ),
              const Spacer(),
              ControlsWidget(),
              const Spacer(),
            ],
          ),
        ),

        const SizedBox(width: 20),

        // Oikea puoli (iso graafi)
        Expanded(
          flex: 7,
          child: GraphWidget(
            temperatureData: data.temperatureData,
            pressureData: data.pressureData,
            currentTime: data.currentTime,
          ),
        ),
      ],
    );
  }
}