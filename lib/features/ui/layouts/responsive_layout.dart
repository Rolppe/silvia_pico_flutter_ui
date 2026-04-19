import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers.dart';
import '../../../models/machine_status.dart';
import '../widgets/value_display.dart';
import '../widgets/controls_widget.dart';
import '../widgets/graph_widget.dart';

// ============================================================================
// RESPONSIVE LAYOUT - SIMPLE & STABLE
// ============================================================================

class ResponsiveLayout extends ConsumerWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(machineDataProvider);
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Padding(
      padding: EdgeInsets.all(isLandscape ? 16 : 24),
      child: isLandscape
          ? _buildLandscape(data)
          : _buildPortrait(data),
    );
  }

  Widget _buildPortrait(MachineStatus data) {
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

  Widget _buildLandscape(MachineStatus data) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              const SizedBox(height: 40),
              ControlsWidget(),
            ],
          ),
        ),
        const SizedBox(width: 20),
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