import 'package:flutter/material.dart';
import '../../core/constants/app_routes.dart';

class PatientListScreen extends StatelessWidget {
  const PatientListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patient Queue List')),
      body: ListView.separated(
        itemCount: 5,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text('\${index + 1}')),
            title: Text('Patient Token B-\${40 + index}'),
            subtitle: const Text('UHID: 100293848123'),
            trailing: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.patientHistory),
              child: const Text('Call In'),
            ),
          );
        },
      ),
    );
  }
}