import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:silvia_pico_ui/models/data_point.dart';

// ============================================================================
// GRAPH WIDGET
// ============================================================================
// This widget draws the real-time scrolling graph for the espresso machine.
// It shows two lines: Temperature (red) and Pressure (blue).
// The graph scrolls from right to left like a paper tape recorder.
//
// Every important setting is explained in plain English so even a
// non-programmer can understand what each part does and how changing it
// affects the visual appearance of the graph.
//
// This style and structure follows the original Swift GraphView.swift.
// ============================================================================

class GraphWidget extends StatelessWidget {

  // ==================== 1. REQUIRED DATA (must be given) ====================
  final List<DataPoint> temperatureData;   // All temperature measurements
  final List<DataPoint> pressureData;      // All pressure measurements
  final double currentTime;                // How many seconds have passed since graph started

  // ==================== 2. MAIN GRAPH SETTINGS ====================
  final double windowSize;                 // How many seconds of data are visible at the same time
  final double maxTemperature;             // Highest temperature shown on left Y-axis
  final double maxPressureBar;             // Highest pressure shown on right Y-axis

  // ==================== 3. LINE APPEARANCE ====================
  final Color temperatureColor;
  final Color pressureColor;
  final double lineWidth;

  // ==================== 4. GRAPH SIZE ====================
  final double chartHeight;

  // ==================== 5. GRID SETTINGS ====================
  final bool showGrid;
  final Color gridColor;
  final double gridLineWidth;
  final bool showHorizontalGrid;
  final bool showVerticalGrid;
  final double? horizontalGridInterval;
  final double? verticalGridInterval;

  // ==================== 6. DEBUG INFO ====================
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

    this.showGrid = true,
    this.gridColor = Colors.grey,
    this.gridLineWidth = 0.8,
    this.showHorizontalGrid = true,
    this.showVerticalGrid = true,
    this.horizontalGridInterval = 10.0,
    this.verticalGridInterval = 10.0,

    this.showDebugInfo = true,
  });

  @override
  Widget build(BuildContext context) {
    // ============================================================================
    // 1. CALCULATE THE VISIBLE TIME WINDOW (rolling window)
    // ============================================================================
    // This decides which part of the data is currently visible on the screen.
    final minTime = currentTime > windowSize
        ? currentTime - windowSize
        : 0.0;

    // This offset makes sure new points always appear from the right edge
    // even when the graph has not yet filled the full windowSize.
    final offset = currentTime < windowSize
        ? windowSize - currentTime
        : 0.0;

    // ============================================================================
    // 2. FILTER DATA TO ONLY WHAT IS VISIBLE
    // ============================================================================
    // We only keep the data points that belong to the current time window.
    final filteredTemp = temperatureData.where((p) => p.time >= minTime).toList();
    final filteredPressure = pressureData.where((p) => p.time >= minTime).toList();

    // ============================================================================
    // 3. BUILD THE GRAPH UI
    // ============================================================================
    return Column(
      children: [
        // ----------------------------------------------------------------------
        // DEBUG ROW (gray bar at the top)
        // ----------------------------------------------------------------------
        // This shows technical information while developing.
        // You can turn it off by setting showDebugInfo: false
        if (showDebugInfo)
          Container(
            padding: const EdgeInsets.all(4),
            color: Colors.black12,
            width: double.infinity,
            child: Text(
              "currentTime: ${currentTime.toStringAsFixed(1)} s | offset: ${offset.toStringAsFixed(1)} | window: ${windowSize.toInt()}s",
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ),

        // Small spacing between debug row and the actual chart
        const SizedBox(height: 8),

        // ----------------------------------------------------------------------
        // THE ACTUAL CHART CONTAINER
        // ----------------------------------------------------------------------
        // We give the chart a fixed height so Flutter knows how much space it has.
        SizedBox(
          height: chartHeight,                    // <-- This controls how tall the graph is
          child: LineChart(
            LineChartData(

              // ----------------------------------------------------------------
              // GRID SETTINGS - the background lines
              // ----------------------------------------------------------------
              gridData: FlGridData(
                show: showGrid,                              // Turn all grid on/off
                drawHorizontalLine: showHorizontalGrid,      // Horizontal lines (temperature)
                drawVerticalLine: showVerticalGrid,          // Vertical lines (time)
                horizontalInterval: horizontalGridInterval,  // Distance between horizontal lines
                verticalInterval: verticalGridInterval,      // Distance between vertical lines
                getDrawingHorizontalLine: (value) => FlLine(
                  color: gridColor,                      // Color of horizontal grid lines
                  strokeWidth: gridLineWidth,            // Thickness of horizontal grid lines
                ),
                getDrawingVerticalLine: (value) => FlLine(
                  color: gridColor,                      // Color of vertical grid lines
                  strokeWidth: gridLineWidth,            // Thickness of vertical grid lines
                ),
              ),

              // ----------------------------------------------------------------
              // AXIS TITLES AND LABELS
              // ----------------------------------------------------------------
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

              // ----------------------------------------------------------------
              // CHART BOUNDARIES
              // ----------------------------------------------------------------
              minX: 0,
              maxX: windowSize,
              minY: 0,
              maxY: maxTemperature + 10,

              // ----------------------------------------------------------------
              // THE TWO LINES (Temperature + Pressure)
              // ----------------------------------------------------------------
              lineBarsData: [
                // Temperature line
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
                // Pressure line (negative values forced to 0)
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
