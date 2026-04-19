import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/ble/ble_repository.dart';
import '../features/ble/ble_notifier.dart';
import '../features/data/machine_data_notifier.dart';
import '../models/machine_status.dart';

// ============================================================================
// PROVIDERS
// ============================================================================

/// Low-level Bluetooth repository
final bleRepositoryProvider = Provider<BLERepository>((ref) {
  final repo = BLERepository();
  ref.onDispose(() => repo.dispose());
  return repo;
});

/// Bluetooth connection status
final bleNotifierProvider = NotifierProvider<BLENotifier, bool>(() => BLENotifier());

/// All machine data and graph state
final machineDataProvider = NotifierProvider<MachineDataNotifier, MachineStatus>(
  () => MachineDataNotifier(),
);
