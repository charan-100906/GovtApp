import 'package:flutter/material.dart';

class LabReportScreen extends StatelessWidget {
  const LabReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lab & Diagnostic Reports')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.biotech, color: Colors.orange),
              title: Text('Complete Blood Count (CBC)'),
              subtitle: Text('Status: Ready | Date: 20/08/2026'),
              trailing: Icon(Icons.remove_red_eye),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.biotech, color: Colors.orange),
              title: Text('X-Ray Chest PA View'),
              subtitle: Text('Status: Pending Verification'),
            ),
          ),
        ],
      ),
    );
  }
}