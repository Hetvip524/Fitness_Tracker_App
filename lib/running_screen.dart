import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RunningScreen extends StatefulWidget {
  @override
  _RunningScreenState createState() => _RunningScreenState();
}

class _RunningScreenState extends State<RunningScreen> {
  List<Map<String, dynamic>> _runs = [];

  void _addRun() async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) {
        final _distanceController = TextEditingController();
        final _timeController = TextEditingController();
        DateTime selectedDate = DateTime.now();
        return AlertDialog(
          title: Text('Log Run'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _distanceController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Distance (km)'),
              ),
              TextField(
                controller: _timeController,
                decoration: InputDecoration(labelText: 'Time (e.g. 30:00)'),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Date: '),
                  Text(DateFormat('yyyy-MM-dd').format(selectedDate)),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        selectedDate = picked;
                        (context as Element).markNeedsBuild();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_distanceController.text.isNotEmpty && _timeController.text.isNotEmpty) {
                  Navigator.pop(context, {
                    'distance': double.tryParse(_distanceController.text) ?? 0.0,
                    'time': _timeController.text,
                    'date': selectedDate,
                  });
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
    if (result != null) {
      setState(() {
        _runs.add(result);
        _runs.sort((a, b) => b['date'].compareTo(a['date']));
      });
    }
  }

  void _deleteRun(int index) {
    setState(() {
      _runs.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Running Tracker')),
      body: _runs.isEmpty
          ? Center(child: Text('No runs logged yet.'))
          : ListView.builder(
              itemCount: _runs.length,
              itemBuilder: (context, index) {
                final run = _runs[index];
                return ListTile(
                  leading: Icon(Icons.directions_run),
                  title: Text('${run['distance']} km in ${run['time']}'),
                  subtitle: Text(DateFormat('yyyy-MM-dd').format(run['date'])),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteRun(index),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRun,
        child: Icon(Icons.add),
        tooltip: 'Log Run',
      ),
    );
  }
} 