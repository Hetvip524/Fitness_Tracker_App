import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Support')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Contact & Support', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text('Email: support@fitnesstracker.com', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Phone: +1 234 567 890', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('FAQ: Visit our website for more info.', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
} 