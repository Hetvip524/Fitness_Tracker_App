import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeightScreen extends StatefulWidget {
  @override
  _WeightScreenState createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  List<Map<String, dynamic>> _weights = [];

  void _addWeightEntry() async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) {
        final _weightController = TextEditingController();
        DateTime selectedDate = DateTime.now();
        return AlertDialog(
          title: Text('Add Weight Entry'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _weightController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Weight (kg)'),
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
                if (_weightController.text.isNotEmpty) {
                  Navigator.pop(context, {
                    'date': selectedDate,
                    'weight': double.tryParse(_weightController.text) ?? 0.0,
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
        _weights.add(result);
        _weights.sort((a, b) => b['date'].compareTo(a['date']));
      });
    }
  }

  void _deleteWeightEntry(int index) {
    setState(() {
      _weights.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weight Tracking')),
      body: _weights.isEmpty
          ? Center(child: Text('No weight entries yet.'))
          : ListView.builder(
              itemCount: _weights.length,
              itemBuilder: (context, index) {
                final entry = _weights[index];
                return ListTile(
                  leading: Icon(Icons.monitor_weight),
                  title: Text('${entry['weight']} kg'),
                  subtitle: Text(DateFormat('yyyy-MM-dd').format(entry['date'])),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteWeightEntry(index),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addWeightEntry,
        child: Icon(Icons.add),
        tooltip: 'Add Weight',
      ),
    );
  }
} 