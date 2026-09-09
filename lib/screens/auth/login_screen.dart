import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _obscurePassword = true;

  String _role = 'patient';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final role =
        GoRouterState.of(context).uri.queryParameters['role'];

    if (role == 'doctor' || role == 'admin' || role == 'patient') {
      _role = role!;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String get _roleTitle {
    switch (_role) {
      case 'doctor':
        return 'Doctor Portal';
      case 'admin':
        return 'Admin Portal';
      default:
        return 'Patient Portal';
    }
  }

  String get _loginTitle {
    switch (_role) {
      case 'doctor':
        return 'Doctor Login';
      case 'admin':
        return 'Admin Login';
      default:
        return 'Patient Login';
    }
  }

  String get _emailLabel {
    switch (_role) {
      case 'doctor':
        return 'Doctor Email';
      case 'admin':
        return 'Admin Email';
      default:
        return 'Email Address';
    }
  }

  IconData get _roleIcon {
    switch (_role) {
      case 'doctor':
        return Icons.medical_services_rounded;
      case 'admin':
        return Icons.admin_panel_settings_rounded;
      default:
        return Icons.person_rounded;
    }
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(
      const Duration(seconds: 1),
    );

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    if (_role == 'doctor') {
      context.go(AppRoutes.doctorDashboard);
    } else if (_role == 'admin') {
      context.go(AppRoutes.adminDashboard);
    } else {
      context.go(AppRoutes.patientDashboard);
    }
  }

  void _goToRegistration() {
    context.push(
      '${AppRoutes.registration}?role=$_role',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F9),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 950,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (MediaQuery.of(context).size.width >= 750)
                    Expanded(
                      child: _buildBranding(),
                    ),

                  if (MediaQuery.of(context).size.width >= 750)
                    const SizedBox(width: 50),

                  Expanded(
                    child: _buildLoginCard(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBranding() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: const Color(0xFF005691),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(
            _roleIcon,
            color: Colors.white,
            size: 38,
          ),
        ),

        const SizedBox(height: 22),

        const Text(
          'Government e-Hospital',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Color(0xFF005691),
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          'Public Health Services Portal',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF64748B),
          ),
        ),

        const SizedBox(height: 30),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFEAF4FA),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _roleIcon,
                size: 18,
                color: const Color(0xFF005691),
              ),
              const SizedBox(width: 8),
              Text(
                _roleTitle,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF005691),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLoginCard() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF4FA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    _roleIcon,
                    color: const Color(0xFF005691),
                    size: 24,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    _loginTitle,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF172033),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Text(
              'Sign in to access your $_role portal.',
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF64748B),
              ),
            ),

            const SizedBox(height: 26),

            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: _emailLabel,
                hintText: 'Enter your email',
                prefixIcon: const Icon(
                  Icons.email_outlined,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your email';
                }

                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: const Icon(
                  Icons.lock_outline_rounded,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }

                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }

                return null;
              },
            ),

            const SizedBox(height: 10),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Password reset feature coming soon.',
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Forgot Password?',
                ),
              ),
            ),

            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _login,
                child: _isLoading
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login to $_roleTitle',
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            size: 18,
                          ),
                        ],
                      ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF64748B),
                  ),
                ),
                TextButton(
                  onPressed: _goToRegistration,
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),

            const Divider(),

            const SizedBox(height: 8),

            Center(
              child: TextButton.icon(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  size: 17,
                ),
                label: const Text(
                  'Back to Portal Selection',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}