import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.notifications_active, color: Color(0xFF005691)),
              title: Text('Token Call Alert'),
              subtitle: Text('Token B-42: Please move towards Room 104.'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text('Lab Report Ready'),
              subtitle: Text('Your CBC blood report is available for viewing.'),
            ),
          ),
        ],
      ),
    );
  }
}