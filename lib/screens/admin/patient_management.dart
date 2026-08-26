import 'package:flutter/material.dart';

class PatientManagementScreen extends StatelessWidget {
  const PatientManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patient Management')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Patient Name \${index + 1}'),
              subtitle: Text('UHID: 10029384\${index}0'),
              trailing: IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
            ),
          );
        },
      ),
    );
  }
}