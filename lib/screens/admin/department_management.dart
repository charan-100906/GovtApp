import 'package:flutter/material.dart';

class DepartmentManagementScreen extends StatelessWidget {
  const DepartmentManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Department Management')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(child: ListTile(title: Text('General Medicine'), subtitle: Text('4 Active Doctors'))),
          Card(child: ListTile(title: Text('Pediatrics'), subtitle: Text('2 Active Doctors'))),
          Card(child: ListTile(title: Text('Orthopedics'), subtitle: Text('3 Active Doctors'))),
        ],
      ),
    );
  }
}