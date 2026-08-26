import 'package:flutter/material.dart';

class PatientHistoryScreen extends StatelessWidget {
  const PatientHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patient Medical History')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('UHID: 100293848123', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Previous Visits & Diagnoses:'),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: const [
                  Card(
                    child: ListTile(
                      title: Text('10/05/2026 - Fever & Cold'),
                      subtitle: Text('Prescribed: Paracetamol 500mg, Rest'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}