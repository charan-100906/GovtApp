import 'package:flutter/material.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_textfield.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneController = TextEditingController();
  String _selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Patient Registration')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomTextField(label: 'Full Name', controller: _nameController, prefixIcon: Icons.person),
            const SizedBox(height: 16),
            CustomTextField(label: 'Age', controller: _ageController, keyboardType: TextInputType.number, prefixIcon: Icons.cake),
            const SizedBox(height: 16),
            CustomTextField(label: 'Mobile Number', controller: _phoneController, keyboardType: TextInputType.phone, prefixIcon: Icons.phone),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedGender,
              decoration: InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white,
              ),
              items: ['Male', 'Female', 'Other'].map((gender) => DropdownMenuItem(value: gender, child: Text(gender))).toList(),
              onChanged: (val) => setState(() => _selectedGender = val!),
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Register Patient & Generate UHID',
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}