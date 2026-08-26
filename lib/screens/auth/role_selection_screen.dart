import 'package:flutter/material.dart';
import '../../core/constants/app_routes.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text(
                'Welcome to\nHealthcare Portal',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              const SizedBox(height: 8),
              const Text('Select your role to proceed with access', style: TextStyle(color: Colors.black54)),
              const SizedBox(height: 40),
              _buildRoleCard(
                context,
                title: 'Patient Portal',
                subtitle: 'Book OP tickets, view queue status & reports',
                icon: Icons.person_outline_rounded,
                color: const Color(0xFF005691),
                onTap: () => Navigator.pushNamed(context, AppRoutes.patientDashboard),
              ),
              const SizedBox(height: 16),
              _buildRoleCard(
                context,
                title: 'Medical Doctor',
                subtitle: 'Manage consultations, check appointments & EHR',
                icon: Icons.health_and_safety_outlined,
                color: const Color(0xFF0088B2),
                onTap: () => Navigator.pushNamed(context, AppRoutes.doctorDashboard),
              ),
              const SizedBox(height: 16),
              _buildRoleCard(
                context,
                title: 'Administrator',
                subtitle: 'Hospital analytics, doctor & department controls',
                icon: Icons.admin_panel_settings_outlined,
                color: const Color(0xFF2E7D32),
                onTap: () => Navigator.pushNamed(context, AppRoutes.adminDashboard),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
                child: Icon(icon, color: color, size: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey.shade400),
            ],
          ),
        ),
      ),
    );
  }
}