// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'machine_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MachineStatus _$MachineStatusFromJson(Map<String, dynamic> json) {
  return _MachineStatus.fromJson(json);
}

/// @nodoc
mixin _$MachineStatus {
  double get boilerTemperature => throw _privateConstructorUsedError;
  double get boilerPressure => throw _privateConstructorUsedError;
  double get pumpRatio => throw _privateConstructorUsedError;
  String get brewMode => throw _privateConstructorUsedError;
  bool get preInfusionOn => throw _privateConstructorUsedError;
  bool get softPressureReleaseOn => throw _privateConstructorUsedError;
  bool get fastHeatupOn => throw _privateConstructorUsedError;
  double get brewTemperature => throw _privateConstructorUsedError;
  int get brewTimer => throw _privateConstructorUsedError;
  double get currentTime => throw _privateConstructorUsedError;
  bool get isGraphPaused => throw _privateConstructorUsedError;
  List<DataPoint> get temperatureData => throw _privateConstructorUsedError;
  List<DataPoint> get pressureData => throw _privateConstructorUsedError;

  /// Serializes this MachineStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MachineStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MachineStatusCopyWith<MachineStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MachineStatusCopyWith<$Res> {
  factory $MachineStatusCopyWith(
          MachineStatus value, $Res Function(MachineStatus) then) =
      _$MachineStatusCopyWithImpl<$Res, MachineStatus>;
  @useResult
  $Res call(
      {double boilerTemperature,
      double boilerPressure,
      double pumpRatio,
      String brewMode,
      bool preInfusionOn,
      bool softPressureReleaseOn,
      bool fastHeatupOn,
      double brewTemperature,
      int brewTimer,
      double currentTime,
      bool isGraphPaused,
      List<DataPoint> temperatureData,
      List<DataPoint> pressureData});
}

/// @nodoc
class _$MachineStatusCopyWithImpl<$Res, $Val extends MachineStatus>
    implements $MachineStatusCopyWith<$Res> {
  _$MachineStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MachineStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boilerTemperature = null,
    Object? boilerPressure = null,
    Object? pumpRatio = null,
    Object? brewMode = null,
    Object? preInfusionOn = null,
    Object? softPressureReleaseOn = null,
    Object? fastHeatupOn = null,
    Object? brewTemperature = null,
    Object? brewTimer = null,
    Object? currentTime = null,
    Object? isGraphPaused = null,
    Object? temperatureData = null,
    Object? pressureData = null,
  }) {
    return _then(_value.copyWith(
      boilerTemperature: null == boilerTemperature
          ? _value.boilerTemperature
          : boilerTemperature // ignore: cast_nullable_to_non_nullable
              as double,
      boilerPressure: null == boilerPressure
          ? _value.boilerPressure
          : boilerPressure // ignore: cast_nullable_to_non_nullable
              as double,
      pumpRatio: null == pumpRatio
          ? _value.pumpRatio
          : pumpRatio // ignore: cast_nullable_to_non_nullable
              as double,
      brewMode: null == brewMode
          ? _value.brewMode
          : brewMode // ignore: cast_nullable_to_non_nullable
              as String,
      preInfusionOn: null == preInfusionOn
          ? _value.preInfusionOn
          : preInfusionOn // ignore: cast_nullable_to_non_nullable
              as bool,
      softPressureReleaseOn: null == softPressureReleaseOn
          ? _value.softPressureReleaseOn
          : softPressureReleaseOn // ignore: cast_nullable_to_non_nullable
              as bool,
      fastHeatupOn: null == fastHeatupOn
          ? _value.fastHeatupOn
          : fastHeatupOn // ignore: cast_nullable_to_non_nullable
              as bool,
      brewTemperature: null == brewTemperature
          ? _value.brewTemperature
          : brewTemperature // ignore: cast_nullable_to_non_nullable
              as double,
      brewTimer: null == brewTimer
          ? _value.brewTimer
          : brewTimer // ignore: cast_nullable_to_non_nullable
              as int,
      currentTime: null == currentTime
          ? _value.currentTime
          : currentTime // ignore: cast_nullable_to_non_nullable
              as double,
      isGraphPaused: null == isGraphPaused
          ? _value.isGraphPaused
          : isGraphPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      temperatureData: null == temperatureData
          ? _value.temperatureData
          : temperatureData // ignore: cast_nullable_to_non_nullable
              as List<DataPoint>,
      pressureData: null == pressureData
          ? _value.pressureData
          : pressureData // ignore: cast_nullable_to_non_nullable
              as List<DataPoint>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MachineStatusImplCopyWith<$Res>
    implements $MachineStatusCopyWith<$Res> {
  factory _$$MachineStatusImplCopyWith(
          _$MachineStatusImpl value, $Res Function(_$MachineStatusImpl) then) =
      __$$MachineStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double boilerTemperature,
      double boilerPressure,
      double pumpRatio,
      String brewMode,
      bool preInfusionOn,
      bool softPressureReleaseOn,
      bool fastHeatupOn,
      double brewTemperature,
      int brewTimer,
      double currentTime,
      bool isGraphPaused,
      List<DataPoint> temperatureData,
      List<DataPoint> pressureData});
}

/// @nodoc
class __$$MachineStatusImplCopyWithImpl<$Res>
    extends _$MachineStatusCopyWithImpl<$Res, _$MachineStatusImpl>
    implements _$$MachineStatusImplCopyWith<$Res> {
  __$$MachineStatusImplCopyWithImpl(
      _$MachineStatusImpl _value, $Res Function(_$MachineStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of MachineStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boilerTemperature = null,
    Object? boilerPressure = null,
    Object? pumpRatio = null,
    Object? brewMode = null,
    Object? preInfusionOn = null,
    Object? softPressureReleaseOn = null,
    Object? fastHeatupOn = null,
    Object? brewTemperature = null,
    Object? brewTimer = null,
    Object? currentTime = null,
    Object? isGraphPaused = null,
    Object? temperatureData = null,
    Object? pressureData = null,
  }) {
    return _then(_$MachineStatusImpl(
      boilerTemperature: null == boilerTemperature
          ? _value.boilerTemperature
          : boilerTemperature // ignore: cast_nullable_to_non_nullable
              as double,
      boilerPressure: null == boilerPressure
          ? _value.boilerPressure
          : boilerPressure // ignore: cast_nullable_to_non_nullable
              as double,
      pumpRatio: null == pumpRatio
          ? _value.pumpRatio
          : pumpRatio // ignore: cast_nullable_to_non_nullable
              as double,
      brewMode: null == brewMode
          ? _value.brewMode
          : brewMode // ignore: cast_nullable_to_non_nullable
              as String,
      preInfusionOn: null == preInfusionOn
          ? _value.preInfusionOn
          : preInfusionOn // ignore: cast_nullable_to_non_nullable
              as bool,
      softPressureReleaseOn: null == softPressureReleaseOn
          ? _value.softPressureReleaseOn
          : softPressureReleaseOn // ignore: cast_nullable_to_non_nullable
              as bool,
      fastHeatupOn: null == fastHeatupOn
          ? _value.fastHeatupOn
          : fastHeatupOn // ignore: cast_nullable_to_non_nullable
              as bool,
      brewTemperature: null == brewTemperature
          ? _value.brewTemperature
          : brewTemperature // ignore: cast_nullable_to_non_nullable
              as double,
      brewTimer: null == brewTimer
          ? _value.brewTimer
          : brewTimer // ignore: cast_nullable_to_non_nullable
              as int,
      currentTime: null == currentTime
          ? _value.currentTime
          : currentTime // ignore: cast_nullable_to_non_nullable
              as double,
      isGraphPaused: null == isGraphPaused
          ? _value.isGraphPaused
          : isGraphPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      temperatureData: null == temperatureData
          ? _value._temperatureData
          : temperatureData // ignore: cast_nullable_to_non_nullable
              as List<DataPoint>,
      pressureData: null == pressureData
          ? _value._pressureData
          : pressureData // ignore: cast_nullable_to_non_nullable
              as List<DataPoint>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MachineStatusImpl implements _MachineStatus {
  const _$MachineStatusImpl(
      {this.boilerTemperature = 0.0,
      this.boilerPressure = 0.0,
      this.pumpRatio = 0.0,
      this.brewMode = 'IDLE',
      this.preInfusionOn = false,
      this.softPressureReleaseOn = false,
      this.fastHeatupOn = false,
      this.brewTemperature = 97.0,
      this.brewTimer = 0,
      this.currentTime = 0.0,
      this.isGraphPaused = false,
      final List<DataPoint> temperatureData = const <DataPoint>[],
      final List<DataPoint> pressureData = const <DataPoint>[]})
      : _temperatureData = temperatureData,
        _pressureData = pressureData;

  factory _$MachineStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$MachineStatusImplFromJson(json);

  @override
  @JsonKey()
  final double boilerTemperature;
  @override
  @JsonKey()
  final double boilerPressure;
  @override
  @JsonKey()
  final double pumpRatio;
  @override
  @JsonKey()
  final String brewMode;
  @override
  @JsonKey()
  final bool preInfusionOn;
  @override
  @JsonKey()
  final bool softPressureReleaseOn;
  @override
  @JsonKey()
  final bool fastHeatupOn;
  @override
  @JsonKey()
  final double brewTemperature;
  @override
  @JsonKey()
  final int brewTimer;
  @override
  @JsonKey()
  final double currentTime;
  @override
  @JsonKey()
  final bool isGraphPaused;
  final List<DataPoint> _temperatureData;
  @override
  @JsonKey()
  List<DataPoint> get temperatureData {
    if (_temperatureData is EqualUnmodifiableListView) return _temperatureData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_temperatureData);
  }

  final List<DataPoint> _pressureData;
  @override
  @JsonKey()
  List<DataPoint> get pressureData {
    if (_pressureData is EqualUnmodifiableListView) return _pressureData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pressureData);
  }

  @override
  String toString() {
    return 'MachineStatus(boilerTemperature: $boilerTemperature, boilerPressure: $boilerPressure, pumpRatio: $pumpRatio, brewMode: $brewMode, preInfusionOn: $preInfusionOn, softPressureReleaseOn: $softPressureReleaseOn, fastHeatupOn: $fastHeatupOn, brewTemperature: $brewTemperature, brewTimer: $brewTimer, currentTime: $currentTime, isGraphPaused: $isGraphPaused, temperatureData: $temperatureData, pressureData: $pressureData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MachineStatusImpl &&
            (identical(other.boilerTemperature, boilerTemperature) ||
                other.boilerTemperature == boilerTemperature) &&
            (identical(other.boilerPressure, boilerPressure) ||
                other.boilerPressure == boilerPressure) &&
            (identical(other.pumpRatio, pumpRatio) ||
                other.pumpRatio == pumpRatio) &&
            (identical(other.brewMode, brewMode) ||
                other.brewMode == brewMode) &&
            (identical(other.preInfusionOn, preInfusionOn) ||
                other.preInfusionOn == preInfusionOn) &&
            (identical(other.softPressureReleaseOn, softPressureReleaseOn) ||
                other.softPressureReleaseOn == softPressureReleaseOn) &&
            (identical(other.fastHeatupOn, fastHeatupOn) ||
                other.fastHeatupOn == fastHeatupOn) &&
            (identical(other.brewTemperature, brewTemperature) ||
                other.brewTemperature == brewTemperature) &&
            (identical(other.brewTimer, brewTimer) ||
                other.brewTimer == brewTimer) &&
            (identical(other.currentTime, currentTime) ||
                other.currentTime == currentTime) &&
            (identical(other.isGraphPaused, isGraphPaused) ||
                other.isGraphPaused == isGraphPaused) &&
            const DeepCollectionEquality()
                .equals(other._temperatureData, _temperatureData) &&
            const DeepCollectionEquality()
                .equals(other._pressureData, _pressureData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      boilerTemperature,
      boilerPressure,
      pumpRatio,
      brewMode,
      preInfusionOn,
      softPressureReleaseOn,
      fastHeatupOn,
      brewTemperature,
      brewTimer,
      currentTime,
      isGraphPaused,
      const DeepCollectionEquality().hash(_temperatureData),
      const DeepCollectionEquality().hash(_pressureData));

  /// Create a copy of MachineStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MachineStatusImplCopyWith<_$MachineStatusImpl> get copyWith =>
      __$$MachineStatusImplCopyWithImpl<_$MachineStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MachineStatusImplToJson(
      this,
    );
  }
}

abstract class _MachineStatus implements MachineStatus {
  const factory _MachineStatus(
      {final double boilerTemperature,
      final double boilerPressure,
      final double pumpRatio,
      final String brewMode,
      final bool preInfusionOn,
      final bool softPressureReleaseOn,
      final bool fastHeatupOn,
      final double brewTemperature,
      final int brewTimer,
      final double currentTime,
      final bool isGraphPaused,
      final List<DataPoint> temperatureData,
      final List<DataPoint> pressureData}) = _$MachineStatusImpl;

  factory _MachineStatus.fromJson(Map<String, dynamic> json) =
      _$MachineStatusImpl.fromJson;

  @override
  double get boilerTemperature;
  @override
  double get boilerPressure;
  @override
  double get pumpRatio;
  @override
  String get brewMode;
  @override
  bool get preInfusionOn;
  @override
  bool get softPressureReleaseOn;
  @override
  bool get fastHeatupOn;
  @override
  double get brewTemperature;
  @override
  int get brewTimer;
  @override
  double get currentTime;
  @override
  bool get isGraphPaused;
  @override
  List<DataPoint> get temperatureData;
  @override
  List<DataPoint> get pressureData;

  /// Create a copy of MachineStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MachineStatusImplCopyWith<_$MachineStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
