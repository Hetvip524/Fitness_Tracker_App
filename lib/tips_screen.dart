import 'package:flutter/material.dart';

class TipsScreen extends StatefulWidget {
  @override
  _TipsScreenState createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  List<String> _tips = [];

  void _addTip() async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) {
        final _tipController = TextEditingController();
        return AlertDialog(
          title: Text('Add Tip'),
          content: TextField(
            controller: _tipController,
            decoration: InputDecoration(labelText: 'Tip'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_tipController.text.isNotEmpty) {
                  Navigator.pop(context, _tipController.text);
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
        _tips.add(result);
      });
    }
  }

  void _deleteTip(int index) {
    setState(() {
      _tips.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tips')),
      body: _tips.isEmpty
          ? Center(child: Text('No tips yet.'))
          : ListView.builder(
              itemCount: _tips.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.lightbulb),
                  title: Text(_tips[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteTip(index),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTip,
        child: Icon(Icons.add),
        tooltip: 'Add Tip',
      ),
    );
  }
} 