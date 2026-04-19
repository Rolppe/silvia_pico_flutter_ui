import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../layouts/portrait_layout.dart';
import '../layouts/landscape_layout.dart';
import '../../../core/providers.dart';

// ============================================================================
// HOME VIEW - CLEAN VERSION (no rotation flash fixes)
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
    print("🔒 WakelockPlus enabled");
  }

  @override
  void dispose() {
    WakelockPlus.disable();
    print("🔓 WakelockPlus disabled");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Käynnistetään BLE-skannaus automaattisesti
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bleNotifierProvider.notifier).startScan();
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
