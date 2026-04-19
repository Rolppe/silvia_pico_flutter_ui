import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:silvia_pico_ui/models/data_point.dart';

// ============================================================================
// GRAPH WIDGET - UPDATED FOR fl_chart 1.2.0
// ============================================================================

class GraphWidget extends StatelessWidget {
  final List<DataPoint> temperatureData;
  final List<DataPoint> pressureData;
  final double currentTime;

  final double windowSize;
  final double maxTemperature;
  final double maxPressureBar;

  final Color temperatureColor;
  final Color pressureColor;
  final double lineWidth;

  final double chartHeight;

  final bool showDebugInfo;

  const GraphWidget({
    super.key,
    required this.temperatureData,
    required this.pressureData,
    required this.currentTime,

    this.windowSize = 60.0,
    this.maxTemperature = 150.0,
    this.maxPressureBar = 15.0,

    this.temperatureColor = Colors.red,
    this.pressureColor = Colors.blue,
    this.lineWidth = 3.5,

    this.chartHeight = 260.0,
    this.showDebugInfo = true,
  });

  @override
  Widget build(BuildContext context) {
    final minTime = currentTime > windowSize ? currentTime - windowSize : 0.0;
    final offset = currentTime < windowSize ? windowSize - currentTime : 0.0;

    final filteredTemp = temperatureData.where((p) => p.time >= minTime).toList();
    final filteredPressure = pressureData.where((p) => p.time >= minTime).toList();

    return Column(
      children: [
        if (showDebugInfo)
          Container(
            padding: const EdgeInsets.all(4),
            color: Colors.black12,
            width: double.infinity,
            child: Text(
              "currentTime: ${currentTime.toStringAsFixed(1)} s | offset: ${offset.toStringAsFixed(1)}",
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ),
        const SizedBox(height: 8),

        SizedBox(
          height: chartHeight,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: true),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 45,
                    getTitlesWidget: (value, meta) => Text('${value.toInt()}°C'),
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 45,
                    getTitlesWidget: (value, meta) => Text((value / 10).toStringAsFixed(1)),
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    getTitlesWidget: (value, meta) {
                      final reversed = (windowSize - value).toInt();
                      return Text('${reversed}s');
                    },
                  ),
                ),
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              minX: 0,
              maxX: windowSize,
              minY: 0,
              maxY: maxTemperature + 10,
              lineBarsData: [
                LineChartBarData(
                  spots: filteredTemp.map((p) {
                    final x = (p.time - minTime + offset).clamp(0.0, windowSize);
                    return FlSpot(x, p.value);
                  }).toList(),
                  isCurved: true,
                  color: temperatureColor,
                  barWidth: lineWidth,
                  dotData: const FlDotData(show: false),
                ),
                LineChartBarData(
                  spots: filteredPressure.map((p) {
                    final x = (p.time - minTime + offset).clamp(0.0, windowSize);
                    final yValue = p.value < 0 ? 0.0 : p.value;
                    return FlSpot(x, yValue * 10);
                  }).toList(),
                  isCurved: true,
                  color: pressureColor,
                  barWidth: lineWidth,
                  dotData: const FlDotData(show: false),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
