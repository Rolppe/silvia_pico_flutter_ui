import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BLERepository {
  static const String targetDeviceName = 'EspressoPico';

  final Guid serviceUUID = Guid('0000180A-0000-1000-8000-00805F9B34FB');
  final Guid dataCharUUID = Guid('00002A29-0000-1000-8000-00805F9B34FB');
  final Guid commandCharUUID = Guid('00002A2A-0000-1000-8000-00805F9B34FB');

  BluetoothDevice? _device;
  BluetoothCharacteristic? _commandCharacteristic;

  final _connectionController = StreamController<bool>.broadcast();
  final _dataController = StreamController<Map<String, dynamic>>.broadcast();

  Stream<bool> get isConnectedStream => _connectionController.stream;
  Stream<Map<String, dynamic>> get dataStream => _dataController.stream;

  bool get isConnected => _device?.isConnected ?? false;

  // ====================== SCAN ======================
  Future<void> startScan() async {
    await FlutterBluePlus.stopScan();
    await FlutterBluePlus.startScan(
      withNames: [targetDeviceName],
      timeout: const Duration(seconds: 12),
    );

    FlutterBluePlus.scanResults.listen((results) {
      for (var result in results) {
        if (result.device.platformName == targetDeviceName) {
          debugPrint("✅ Löydettiin EspressoPico – yhdistetään...");
          _connectToDevice(result.device);
          return;
        }
      }
    });
  }

  // ====================== CONNECT ======================
  Future<void> _connectToDevice(BluetoothDevice device) async {
    // Jos jo yhdistetty samaan laitteeseen, älä yritä uudestaan
    if (_device?.remoteId == device.remoteId && isConnected) return;

    try {
      _device = device;
      await device.connect(autoConnect: false);
      debugPrint("✅ Connect onnistui!");

      _connectionController.add(true);

      // Kuuntele disconnectionia luotettavasti
      device.connectionState.listen((state) {
        if (state == BluetoothConnectionState.disconnected) {
          debugPrint("❌ Laite irtosi (power off tai signaali katosi)");
          _device = null;
          _connectionController.add(false);
        }
      });

      await Future.delayed(const Duration(milliseconds: 800));
      await _discoverServices();
    } catch (e) {
      debugPrint("❌ Connect epäonnistui: $e");
      _device = null;
      _connectionController.add(false);
    }
  }

  // ====================== SERVICES ======================
  Future<void> _discoverServices() async {
    if (_device == null) return;
    try {
      final services = await _device!.discoverServices();
      for (var service in services) {
        if (service.uuid == serviceUUID) {
          for (var char in service.characteristics) {
            if (char.uuid == dataCharUUID) {
              await char.setNotifyValue(true);
              char.onValueReceived.listen((value) {
                if (value.isNotEmpty) {
                  try {
                    final json = jsonDecode(utf8.decode(value)) as Map<String, dynamic>;
                    _dataController.add(json);
                  } catch (_) {}
                }
              });
            } else if (char.uuid == commandCharUUID) {
              _commandCharacteristic = char;
            }
          }
        }
      }
    } catch (e) {
      debugPrint("❌ Service discovery error: $e");
    }
  }

  void sendCommand(String command) {
    if (_commandCharacteristic == null || !isConnected) return;
    try {
      final data = utf8.encode(command);
      _commandCharacteristic!.write(data, withoutResponse: false);
    } catch (_) {}
  }

  Future<void> disconnect() async {
    await _device?.disconnect();
    _device = null;
    _connectionController.add(false);
  }

  void dispose() {
    _connectionController.close();
    _dataController.close();
  }
}
