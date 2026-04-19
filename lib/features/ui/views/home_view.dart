import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../layouts/portrait_layout.dart';
import '../layouts/landscape_layout.dart';
import '../../../core/providers.dart';

// ============================================================================
// HOME VIEW - PREVIOUS VERSION (OrientationBuilder)
// ============================================================================

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {

  @override
  void initState() {
    super.initState();
    WakelockPlus.enable();
  }

  @override
  void dispose() {
    WakelockPlus.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bleNotifierProvider.notifier).startScan();
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Silvia Pico'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(bleNotifierProvider.notifier).startScan(),
          ),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return const LandscapeLayout();
          } else {
            return const PortraitLayout();
          }
        },
      ),
    );
  }
}