import 'package:flutter/material.dart';
import '../../core/widgets/custom_button.dart';
import '../../services/firestore_service.dart';

class OpTicketScreen extends StatefulWidget {
  const OpTicketScreen({super.key});

  @override
  State<OpTicketScreen> createState() => _OpTicketScreenState();
}

class _OpTicketScreenState extends State<OpTicketScreen> {
  String? selectedDepartment;
  bool isGenerating = false;
  final FirestoreService _firestoreService = FirestoreService();

  final List<String> departments = [
    'General Medicine',
    'Orthopedics',
    'Pediatrics',
    'Cardiology',
    'Dermatology',
    'ENT',
  ];

  void _bookTicket() async {
    if (selectedDepartment == null) return;
    setState(() => isGenerating = true);

    String token = await _firestoreService.generateOpToken(selectedDepartment!);

    if (mounted) {
      setState(() => isGenerating = false);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('OP Ticket Generated', textAlign: TextAlign.center),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(selectedDepartment!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(8)),
                child: Text(token, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF005691))),
              ),
              const SizedBox(height: 12),
              const Text('Please wait in the respective department waiting hall.'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('OK'),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Generate OP Ticket')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select Department', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade300)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedDepartment,
                  isExpanded: true,
                  hint: const Text('Choose Specialty'),
                  items: departments.map((dept) => DropdownMenuItem(value: dept, child: Text(dept))).toList(),
                  onChanged: (val) => setState(() => selectedDepartment = val),
                ),
              ),
            ),
            const Spacer(),
            isGenerating
                ? const Center(child: CircularProgressIndicator())
                : CustomButton(
                    text: 'Issue OP Token',
                    onPressed: _bookTicket,
                  ),
          ],
        ),
      ),
    );
  }
}