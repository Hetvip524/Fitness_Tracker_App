import 'package:flutter/material.dart';

class MealPlanScreen extends StatefulWidget {
  @override
  _MealPlanScreenState createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {
  List<Map<String, String>> _meals = [];

  void _addMeal() async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        final _nameController = TextEditingController();
        final _timeController = TextEditingController();
        return AlertDialog(
          title: Text('Add Meal'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Meal Name'),
              ),
              TextField(
                controller: _timeController,
                decoration: InputDecoration(labelText: 'Time (e.g. Breakfast, 8:00 AM)'),
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
                    'time': _timeController.text,
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
        _meals.add(result);
      });
    }
  }

  void _deleteMeal(int index) {
    setState(() {
      _meals.removeAt(index);
    });
  }

  void _showMealDetails(Map<String, String> meal) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(meal['name'] ?? ''),
        content: Text('Time: ${meal['time'] ?? ''}'),
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
      appBar: AppBar(title: Text('Meal Plan')),
      body: _meals.isEmpty
          ? Center(child: Text('No meals planned yet.'))
          : ListView.builder(
              itemCount: _meals.length,
              itemBuilder: (context, index) {
                final meal = _meals[index];
                return ListTile(
                  leading: Icon(Icons.restaurant_menu),
                  title: Text(meal['name'] ?? ''),
                  subtitle: Text(meal['time'] ?? ''),
                  onTap: () => _showMealDetails(meal),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteMeal(index),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addMeal,
        child: Icon(Icons.add),
        tooltip: 'Add Meal',
      ),
    );
  }
} 