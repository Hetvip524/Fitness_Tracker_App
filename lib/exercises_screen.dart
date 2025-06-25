import 'package:flutter/material.dart';

class ExercisesScreen extends StatefulWidget {
  @override
  _ExercisesScreenState createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  List<Map<String, String>> _exercises = [];

  void _addExercise() async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        final _nameController = TextEditingController();
        final _descController = TextEditingController();
        return AlertDialog(
          title: Text('Add Exercise'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Exercise Name'),
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
        _exercises.add(result);
      });
    }
  }

  void _deleteExercise(int index) {
    setState(() {
      _exercises.removeAt(index);
    });
  }

  void _showExerciseDetails(Map<String, String> exercise) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(exercise['name'] ?? ''),
        content: Text(exercise['desc'] ?? ''),
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
      appBar: AppBar(title: Text('Exercises')),
      body: _exercises.isEmpty
          ? Center(child: Text('No exercises yet.'))
          : ListView.builder(
              itemCount: _exercises.length,
              itemBuilder: (context, index) {
                final exercise = _exercises[index];
                return ListTile(
                  leading: Icon(Icons.fitness_center),
                  title: Text(exercise['name'] ?? ''),
                  subtitle: Text(exercise['desc'] ?? ''),
                  onTap: () => _showExerciseDetails(exercise),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteExercise(index),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addExercise,
        child: Icon(Icons.add),
        tooltip: 'Add Exercise',
      ),
    );
  }
} 