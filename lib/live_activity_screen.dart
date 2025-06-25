import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';

enum ChartType { line, bar }
enum DataType { steps, distance, calories }

class LiveActivityScreen extends StatefulWidget {
  @override
  _LiveActivityScreenState createState() => _LiveActivityScreenState();
}

class _LiveActivityScreenState extends State<LiveActivityScreen> {
  Stream<StepCount>? _stepCountStream;
  int _steps = 0;
  List<FlSpot> _stepData = [FlSpot(0, 0)];
  DateTime _startTime = DateTime.now();
  ChartType _selectedChartType = ChartType.line;
  DataType _selectedDataType = DataType.steps;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream?.listen((event) {
        setState(() {
          _steps = event.steps;
          final minutes = DateTime.now().difference(_startTime).inMinutes.toDouble();
          _stepData.add(FlSpot(minutes, _steps.toDouble()));
          if (_stepData.length > 30) _stepData.removeAt(0);
        });
      });
    }
  }

  void _simulateStep() {
    setState(() {
      _steps += 10;
      final minutes = DateTime.now().difference(_startTime).inMinutes.toDouble();
      _stepData.add(FlSpot(minutes, _steps.toDouble()));
      if (_stepData.length > 30) _stepData.removeAt(0);
    });
  }

  List<FlSpot> _getChartSpots() {
    switch (_selectedDataType) {
      case DataType.steps:
        return _stepData;
      case DataType.distance:
        return _stepData.map((spot) => FlSpot(spot.x, spot.y * 0.0008)).toList();
      case DataType.calories:
        return _stepData.map((spot) => FlSpot(spot.x, spot.y * 0.04)).toList();
    }
  }

  String _getDataLabel() {
    switch (_selectedDataType) {
      case DataType.steps:
        return 'Steps';
      case DataType.distance:
        return 'Distance (km)';
      case DataType.calories:
        return 'Calories';
    }
  }

  Widget _buildLineChart() {
    final spots = _getChartSpots();
    return LineChart(
      LineChartData(
        minX: spots.first.x,
        maxX: spots.last.x == spots.first.x ? spots.last.x + 1 : spots.last.x,
        minY: 0,
        maxY: spots.map((e) => e.y).fold<double>(0, (prev, y) => y > prev ? y : prev) + 10,
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: Colors.blue,
            barWidth: 3,
            belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.2)),
            dotData: FlDotData(show: false),
          ),
        ],
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 40)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 32)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
      ),
    );
  }

  Widget _buildBarChart() {
    final spots = _getChartSpots();
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: spots.map((e) => e.y).fold<double>(0, (prev, y) => y > prev ? y : prev) + 10,
        barGroups: spots
            .map((spot) => BarChartGroupData(
                  x: spot.x.toInt(),
                  barRods: [BarChartRodData(toY: spot.y, color: Colors.amber)],
                ))
            .toList(),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 40)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 32, getTitlesWidget: (value, meta) => Text(value.toInt().toString()))),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double distance = _steps * 0.0008;
    double calories = _steps * 0.04;
    return Scaffold(
      appBar: AppBar(title: Text('Live Activity')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Icon(Icons.directions_walk, size: 64, color: Colors.blue),
                      SizedBox(height: 16),
                      Text('Steps', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      Text('$_steps', style: TextStyle(fontSize: 32)),
                      SizedBox(height: 16),
                      Text('Distance', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      Text('${distance.toStringAsFixed(2)} km', style: TextStyle(fontSize: 28)),
                      SizedBox(height: 16),
                      Text('Calories', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      Text('${calories.toStringAsFixed(0)}', style: TextStyle(fontSize: 28)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              
              SegmentedButton<ChartType>(
                segments: [
                  ButtonSegment(value: ChartType.line, label: Text('Line')),
                  ButtonSegment(value: ChartType.bar, label: Text('Bar')),
                ],
                selected: {_selectedChartType},
                onSelectionChanged: (newSelection) => setState(() => _selectedChartType = newSelection.first),
              ),
              SizedBox(height: 16),
              SegmentedButton<DataType>(
                segments: [
                  ButtonSegment(value: DataType.steps, label: Text('Steps')),
                  ButtonSegment(value: DataType.distance, label: Text('Distance')),
                  ButtonSegment(value: DataType.calories, label: Text('Calories')),
                ],
                selected: {_selectedDataType},
                onSelectionChanged: (newSelection) => setState(() => _selectedDataType = newSelection.first),
              ),
              
              SizedBox(height: 24),
              Text('${_getDataLabel()} Over Time', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(
                height: 220,
                child: _selectedChartType == ChartType.line ? _buildLineChart() : _buildBarChart(),
              ),
              if (kIsWeb) ...[
                SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: _simulateStep,
                  icon: Icon(Icons.add),
                  label: Text('Simulate 10 Steps'),
                ),
                Text('Use this button to simulate step increases on web.'),
              ],
            ],
          ),
        ),
      ),
    );
  }
} 