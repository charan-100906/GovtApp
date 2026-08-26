import 'package:flutter/material.dart';

class DoctorManagementScreen extends StatelessWidget {
  const DoctorManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Doctor Management')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Dr. Staff Doctor \${index + 1}'),
              subtitle: const Text('General OPD'),
              trailing: Switch(value: true, onChanged: (val) {}),
            ),
          );
        },
      ),
    );
  }
}