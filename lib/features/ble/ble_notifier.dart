import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ble_repository.dart';
import '../../core/providers.dart';

// ============================================================================
// BLE NOTIFIER – VAKAAMPI RECONNECT
// ============================================================================

class BLENotifier extends Notifier<bool> {
  late final BLERepository _repository;
  StreamSubscription<bool>? _connectionSubscription;
  Timer? _reconnectTimer;

  @override
  bool build() {
    _repository = ref.watch(bleRepositoryProvider);

    _connectionSubscription?.cancel();
    _connectionSubscription = _repository.isConnectedStream.listen((connected) {
      state = connected;
      if (connected) {
        _reconnectTimer?.cancel();
      } else {
        _startReconnectTimer();
      }
    });

    ref.onDispose(() {
      _connectionSubscription?.cancel();
      _reconnectTimer?.cancel();
    });

    _startReconnectTimer();
    return false;
  }

  void _startReconnectTimer() {
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer.periodic(const Duration(seconds: 6), (_) {
      if (!state) {
        _repository.startScan();
      }
    });
  }

  void startScan() => _repository.startScan();
  void sendCommand(String command) => _repository.sendCommand(command);
  void disconnect() => _repository.disconnect();
}
