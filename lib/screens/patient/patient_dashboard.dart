import 'package:flutter/material.dart';
import '../../core/constants/app_routes.dart';

class PatientDashboard extends StatelessWidget {
  const PatientDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.notifications),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome, John Doe', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('UHID: 100293848123', style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildLiveQueueCard(context),
            const SizedBox(height: 24),
            const Text('Primary Services', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                _buildServiceTile(context, Icons.confirmation_number_outlined, 'OP Ticket', Colors.blue, () => Navigator.pushNamed(context, AppRoutes.opTicket)),
                _buildServiceTile(context, Icons.medical_services_outlined, 'Doctors', Colors.teal, () => Navigator.pushNamed(context, AppRoutes.doctorScreen)),
                _buildServiceTile(context, Icons.assignment_outlined, 'EHR Records', Colors.purple, () => Navigator.pushNamed(context, AppRoutes.ehr)),
                _buildServiceTile(context, Icons.biotech_outlined, 'Lab Reports', Colors.orange, () => Navigator.pushNamed(context, AppRoutes.labReport)),
                _buildServiceTile(context, Icons.medication_outlined, 'Pharmacy', Colors.green, () => Navigator.pushNamed(context, AppRoutes.pharmacy)),
                _buildServiceTile(context, Icons.queue_outlined, 'Live Queue', Colors.red, () => Navigator.pushNamed(context, AppRoutes.queue)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLiveQueueCard(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle)),
                    const SizedBox(width: 6),
                    const Text('Active Token: General Medicine', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('Token # B-42', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
                const Text('Estimated wait: ~15 mins', style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber.shade800,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () => Navigator.pushNamed(context, AppRoutes.queue),
              child: const Text('Track Status'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceTile(BuildContext context, IconData icon, String label, Color color, VoidCallback onTap) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      elevation: 1,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(height: 8),
            Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}