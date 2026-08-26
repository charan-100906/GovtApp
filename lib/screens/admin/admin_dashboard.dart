import 'package:flutter/material.dart';
import '../../core/constants/app_routes.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hospital Admin Panel')),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildAdminTile(context, Icons.person_search, 'Patients', AppRoutes.patientManagement),
          _buildAdminTile(context, Icons.people_alt, 'Doctors', AppRoutes.doctorManagement),
          _buildAdminTile(context, Icons.local_hospital, 'Departments', AppRoutes.departmentManagement),
          _buildAdminTile(context, Icons.bar_chart, 'OPD Reports', AppRoutes.reports),
        ],
      ),
    );
  }

  Widget _buildAdminTile(BuildContext context, IconData icon, String label, String route) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        borderRadius: BorderRadius.circular(12),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: const Color(0xFF005691)),
              const SizedBox(height: 8),
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}