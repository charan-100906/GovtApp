import 'package:flutter/material.dart';

class EhrScreen extends StatelessWidget {
  const EhrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medical Records (EHR)')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.description, color: Color(0xFF005691)),
              title: Text('Prescription #${1082 + index}'),
              subtitle: const Text('Dr. A. Sharma — Gen Medicine\nDate: 12/08/2026'),
              trailing: const Icon(Icons.download_rounded),
              isThreeLine: true,
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}