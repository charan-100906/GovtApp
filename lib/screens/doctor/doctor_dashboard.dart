import 'package:flutter/material.dart';
import '../../core/constants/app_routes.dart';

class DoctorDashboard extends StatelessWidget {
  const DoctorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Doctor Portal')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dr. Rajesh Kumar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Department of General Medicine', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            leading: const Icon(Icons.people),
            title: const Text('Active Patient Waiting List'),
            trailing: const Chip(label: Text('14 Waiting')),
            onTap: () => Navigator.pushNamed(context, AppRoutes.doctorPatientList),
          ),
        ],
      ),
    );
  }
}