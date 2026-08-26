import 'package:flutter/material.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Available Doctors')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text('Dr. Doctor Name ${index + 1}'),
              subtitle: const Text('Specialization • Available Today'),
              trailing: const Chip(
                label: Text('Duty On'),
                backgroundColor: Colors.greenAccent,
              ),
            ),
          );
        },
      ),
    );
  }
}