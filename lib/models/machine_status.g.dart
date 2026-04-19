// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MachineStatusImpl _$$MachineStatusImplFromJson(Map<String, dynamic> json) =>
    _$MachineStatusImpl(
      boilerTemperature: (json['boilerTemperature'] as num?)?.toDouble() ?? 0.0,
      boilerPressure: (json['boilerPressure'] as num?)?.toDouble() ?? 0.0,
      pumpRatio: (json['pumpRatio'] as num?)?.toDouble() ?? 0.0,
      brewMode: json['brewMode'] as String? ?? 'IDLE',
      preInfusionOn: json['preInfusionOn'] as bool? ?? false,
      softPressureReleaseOn: json['softPressureReleaseOn'] as bool? ?? false,
      fastHeatupOn: json['fastHeatupOn'] as bool? ?? false,
      brewTemperature: (json['brewTemperature'] as num?)?.toDouble() ?? 97.0,
      brewTimer: (json['brewTimer'] as num?)?.toInt() ?? 0,
      currentTime: (json['currentTime'] as num?)?.toDouble() ?? 0.0,
      isGraphPaused: json['isGraphPaused'] as bool? ?? false,
      temperatureData: (json['temperatureData'] as List<dynamic>?)
              ?.map((e) => DataPoint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <DataPoint>[],
      pressureData: (json['pressureData'] as List<dynamic>?)
              ?.map((e) => DataPoint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <DataPoint>[],
    );

Map<String, dynamic> _$$MachineStatusImplToJson(_$MachineStatusImpl instance) =>
    <String, dynamic>{
      'boilerTemperature': instance.boilerTemperature,
      'boilerPressure': instance.boilerPressure,
      'pumpRatio': instance.pumpRatio,
      'brewMode': instance.brewMode,
      'preInfusionOn': instance.preInfusionOn,
      'softPressureReleaseOn': instance.softPressureReleaseOn,
      'fastHeatupOn': instance.fastHeatupOn,
      'brewTemperature': instance.brewTemperature,
      'brewTimer': instance.brewTimer,
      'currentTime': instance.currentTime,
      'isGraphPaused': instance.isGraphPaused,
      'temperatureData': instance.temperatureData,
      'pressureData': instance.pressureData,
    };
