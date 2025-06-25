import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrainingStatusScreen extends StatefulWidget {
  @override
  _TrainingStatusScreenState createState() => _TrainingStatusScreenState();
}

class _TrainingStatusScreenState extends State<TrainingStatusScreen> {
  List<Map<String, dynamic>> _workouts = [];

  void _addWorkout() async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) {
        final _nameController = TextEditingController();
        DateTime selectedDate = DateTime.now();
        return AlertDialog(
          title: Text('Add Completed Workout'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Workout Name'),
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
                if (_nameController.text.isNotEmpty) {
                  Navigator.pop(context, {
                    'name': _nameController.text,
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
        _workouts.add(result);
        _workouts.sort((a, b) => b['date'].compareTo(a['date']));
      });
    }
  }

  void _deleteWorkout(int index) {
    setState(() {
      _workouts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Training Status')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Completed Workouts: ${_workouts.length}', style: TextStyle(fontSize: 18)),
          ),
          Expanded(
            child: _workouts.isEmpty
                ? Center(child: Text('No completed workouts yet.'))
                : ListView.builder(
                    itemCount: _workouts.length,
                    itemBuilder: (context, index) {
                      final workout = _workouts[index];
                      return ListTile(
                        leading: Icon(Icons.check_circle, color: Colors.green),
                        title: Text(workout['name'] ?? ''),
                        subtitle: Text(DateFormat('yyyy-MM-dd').format(workout['date'])),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteWorkout(index),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addWorkout,
        child: Icon(Icons.add),
        tooltip: 'Add Workout',
      ),
    );
  }
} 