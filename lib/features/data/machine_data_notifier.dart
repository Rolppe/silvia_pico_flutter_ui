import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silvia_pico_ui/models/machine_status.dart';
import 'package:silvia_pico_ui/models/data_point.dart';
//import 'package:silvia_pico_ui/features/ble/ble_repository.dart';
import 'package:silvia_pico_ui/core/providers.dart';

class MachineDataNotifier extends Notifier<MachineStatus> {
  DateTime? _startTime;
  Timer? _brewTimerTask;
  final Set<String> _brewingModes = {'pre-infusion main', 'brew loop'};

  @override
  MachineStatus build() {
    final repo = ref.watch(bleRepositoryProvider);
    _startTime ??= DateTime.now();
    print("🔄 [Notifier] build() – startTime asetettu");

    repo.dataStream.listen(_updateFromJson);
    ref.onDispose(() => _brewTimerTask?.cancel());
    return const MachineStatus();
  }

  void _updateFromJson(Map<String, dynamic> json) {
    print("📥 [Notifier] JSON saapui: $json");
    try {
      final previousMode = state.brewMode;
      final updated = state.copyWith(
        boilerTemperature: (json['boiler_temperature'] as num?)?.toDouble() ?? state.boilerTemperature,
        boilerPressure: (json['pressure'] as num?)?.toDouble() ?? state.boilerPressure,
        pumpRatio: (json['pump_ratio'] as num?)?.toDouble() ?? state.pumpRatio,
        brewMode: json['mode'] as String? ?? state.brewMode,
        preInfusionOn: json['pre_infusion_mode'] as bool? ?? state.preInfusionOn,
        softPressureReleaseOn: json['pressure_soft_release_mode'] as bool? ?? state.softPressureReleaseOn,
        fastHeatupOn: json['fast_heatup_mode'] as bool? ?? state.fastHeatupOn,
        brewTemperature: (json['brew_temperature'] as num?)?.toDouble() ?? state.brewTemperature,
      );

      final isBrewingNow = _brewingModes.contains(updated.brewMode);
      final wasBrewingBefore = _brewingModes.contains(previousMode);

      if (isBrewingNow && !wasBrewingBefore) _startBrewTimer();
      else if (updated.brewMode == 'IDLE') {
        _stopBrewTimer();
        _resetBrewTimerAfterDelay();
      }

      if (!updated.isGraphPaused && _startTime != null) {
        final time = DateTime.now().difference(_startTime!).inMilliseconds / 1000.0;
        print("⏱️ [Notifier] currentTime = $time s");

        final newTemp = List<DataPoint>.from(updated.temperatureData)..add(DataPoint(time: time, value: updated.boilerTemperature));
        final newPress = List<DataPoint>.from(updated.pressureData)..add(DataPoint(time: time, value: updated.boilerPressure));

        if (newTemp.length > 400) newTemp.removeAt(0);
        if (newPress.length > 400) newPress.removeAt(0);

        state = updated.copyWith(
          temperatureData: newTemp,
          pressureData: newPress,
          currentTime: time,
        );
      } else {
        state = updated;
      }
    } catch (e) {
      print("❌ [Notifier] JSON-virhe: $e");
    }
  }

  void _startBrewTimer() {
    _stopBrewTimer();
    _brewTimerTask = Timer.periodic(const Duration(seconds: 1), (_) {
      state = state.copyWith(brewTimer: state.brewTimer + 1);
    });
  }

  void _stopBrewTimer() => _brewTimerTask?.cancel();

  void _resetBrewTimerAfterDelay() {
    Future.delayed(const Duration(seconds: 10), () {
      if (state.brewMode == 'IDLE') state = state.copyWith(brewTimer: 0);
    });
  }

  void pauseGraph() => state = state.copyWith(isGraphPaused: true);
  void resetGraphForNewSession() {
    _startTime = DateTime.now();
    print("🔄 [Notifier] Käyttäjä nollasi graafin");
    state = const MachineStatus(
      temperatureData: [],
      pressureData: [],
      currentTime: 0.0,
      brewTimer: 0,
      isGraphPaused: false,
    );
  }
}