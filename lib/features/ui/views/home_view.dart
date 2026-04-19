import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../layouts/portrait_layout.dart';
import '../layouts/landscape_layout.dart';
import '../../../core/providers.dart';

// ============================================================================
// HOME VIEW - FAST BLACK OVERLAY DURING ROTATION
// ============================================================================

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  bool _showBlackScreen = false;

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
    final orientation = MediaQuery.of(context).orientation;

    // Käynnistetään BLE
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
      body: Stack(
        children: [
          // Molemmat layoutit pidetään muistissa
          IndexedStack(
            index: orientation == Orientation.landscape ? 1 : 0,
            children: const [
              PortraitLayout(),
              LandscapeLayout(),
            ],
          ),

          // Musta ruutu — aktivoituu mahdollisimman aikaisin
          AnimatedOpacity(
            opacity: _showBlackScreen ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 40),     // erittäin nopea fade-in
            child: Container(color: Colors.black),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Tämä kutsutaan aina kun orientation muuttuu
    setState(() {
      _showBlackScreen = true;
    });

    // Poistetaan musta ruutu nopeasti kun uusi layout on valmis
    Future.delayed(const Duration(milliseconds: 280), () {
      if (mounted) {
        setState(() {
          _showBlackScreen = false;
        });
      }
    });
  }
}
