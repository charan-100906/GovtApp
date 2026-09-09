import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    debugPrint('SPLASH: Started');

    _timer = Timer(const Duration(seconds: 3), () {
      debugPrint('SPLASH: 3 seconds completed');

      if (!mounted) {
        debugPrint('SPLASH: Widget is not mounted');
        return;
      }

      debugPrint('SPLASH: Navigating to ${AppRoutes.roleSelection}');

      context.go(AppRoutes.roleSelection);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF005691),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.local_hospital,
                  size: 70,
                  color: Color(0xFF005691),
                ),
              ),
            ),
            const SizedBox(height: 35),
            const Text(
              'Government e-Hospital',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Public Health Services Portal',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 21,
              ),
            ),
            const SizedBox(height: 60),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}