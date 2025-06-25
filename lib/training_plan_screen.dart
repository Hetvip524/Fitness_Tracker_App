import 'package:flutter/material.dart';

class TrainingPlanScreen extends StatefulWidget {
  @override
  _TrainingPlanScreenState createState() => _TrainingPlanScreenState();
}

class _TrainingPlanScreenState extends State<TrainingPlanScreen> {
  List<Map<String, String>> _plans = [];

  void _addPlan() async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        final _nameController = TextEditingController();
        final _descController = TextEditingController();
        return AlertDialog(
          title: Text('Add Training Plan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Plan Name'),
              ),
              TextField(
                controller: _descController,
                decoration: InputDecoration(labelText: 'Description'),
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
                    'desc': _descController.text,
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
        _plans.add(result);
      });
    }
  }

  void _deletePlan(int index) {
    setState(() {
      _plans.removeAt(index);
    });
  }

  void _showPlanDetails(Map<String, String> plan) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(plan['name'] ?? ''),
        content: Text(plan['desc'] ?? ''),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Training Plan')),
      body: _plans.isEmpty
          ? Center(child: Text('No training plans yet.'))
          : ListView.builder(
              itemCount: _plans.length,
              itemBuilder: (context, index) {
                final plan = _plans[index];
                return ListTile(
                  leading: Icon(Icons.fitness_center),
                  title: Text(plan['name'] ?? ''),
                  subtitle: Text(plan['desc'] ?? ''),
                  onTap: () => _showPlanDetails(plan),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deletePlan(index),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPlan,
        child: Icon(Icons.add),
        tooltip: 'Add Plan',
      ),
    );
  }
} 