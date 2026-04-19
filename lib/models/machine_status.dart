// ============================================================================
// machine_status.dart
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';
import 'data_point.dart';

part 'machine_status.freezed.dart';
part 'machine_status.g.dart';

// ============================================================================
// MODEL
// ============================================================================

@freezed
class MachineStatus with _$MachineStatus {
  const factory MachineStatus({
    @Default(0.0) double boilerTemperature,
    @Default(0.0) double boilerPressure,
    @Default(0.0) double pumpRatio,
    @Default('IDLE') String brewMode,
    @Default(false) bool preInfusionOn,
    @Default(false) bool softPressureReleaseOn,
    @Default(false) bool fastHeatupOn,
    @Default(97.0) double brewTemperature,
    @Default(0) int brewTimer,
    @Default(0.0) double currentTime,
    @Default(false) bool isGraphPaused,
    @Default(<DataPoint>[]) List<DataPoint> temperatureData,
    @Default(<DataPoint>[]) List<DataPoint> pressureData,
  }) = _MachineStatus;

  factory MachineStatus.fromJson(Map<String, dynamic> json) => _$MachineStatusFromJson(json);
}
