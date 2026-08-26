import 'package:flutter/material.dart';

class QueueScreen extends StatelessWidget {
  const QueueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live Queue Monitor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: const Column(
                children: [
                  Text('Current Processing Token', style: TextStyle(color: Colors.grey, fontSize: 14)),
                  SizedBox(height: 8),
                  Text('B-40', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFF005691))),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(children: [Text('Your Token', style: TextStyle(color: Colors.grey)), Text('B-42', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))]),
                      Column(children: [Text('Ahead of You', style: TextStyle(color: Colors.grey)), Text('2 Patients', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange))]),
                    ],
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