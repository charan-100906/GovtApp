import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_routes.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  static const Color primary = Color(0xFF005691);
  static const Color background = Color(0xFFF4F7F9);
  static const Color textDark = Color(0xFF172033);
  static const Color textLight = Color(0xFF64748B);
  static const Color border = Color(0xFFE2E8F0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool isDesktop = constraints.maxWidth >= 1000;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 60 : 20,
                vertical: 28,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 1180,
                  ),
                  child: Column(
                    children: [
                      _buildHeader(),

                      const SizedBox(height: 34),

                      _buildWelcomeSection(),

                      const SizedBox(height: 28),

                      _buildPortalCards(
                        context,
                        isDesktop,
                      ),

                      const SizedBox(height: 28),

                      _buildInfoBanner(),

                      const SizedBox(height: 28),

                      _buildFooter(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Icons.local_hospital_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),

        const SizedBox(width: 14),

        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Government e-Hospital',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: primary,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Public Health Services Portal',
                style: TextStyle(
                  fontSize: 12,
                  color: textLight,
                ),
              ),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: border,
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.verified_user_outlined,
                size: 16,
                color: primary,
              ),
              SizedBox(width: 6),
              Text(
                'Secure Portal',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: textDark,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 26,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: border,
        ),
      ),
      child: const Column(
        children: [
          Text(
            'Welcome to Healthcare Portal',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: textDark,
            ),
          ),

          SizedBox(height: 8),

          Text(
            'Select your portal to access government healthcare services',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: textLight,
            ),
          ),

          SizedBox(height: 16),

          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 8,
            children: [
              _SmallFeature(
                icon: Icons.lock_outline_rounded,
                text: 'Secure Access',
              ),
              _SmallFeature(
                icon: Icons.devices_outlined,
                text: 'Digital Services',
              ),
              _SmallFeature(
                icon: Icons.access_time_rounded,
                text: '24/7 Access',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPortalCards(
    BuildContext context,
    bool isDesktop,
  ) {
    final cards = [
      _PortalData(
        icon: Icons.person_rounded,
        title: 'Patient Portal',
        description:
            'Access appointments, health records and healthcare services.',
        features: [
          'Book OP appointments',
          'View health records',
          'Check queue status',
        ],
        buttonText: 'Patient Login',
        onPressed: () {
          context.push(
            '${AppRoutes.login}?role=patient',
          );
        },
      ),

      _PortalData(
        icon: Icons.medical_services_rounded,
        title: 'Doctor Portal',
        description:
            'Manage patients, appointments and clinical information.',
        features: [
          'View patient list',
          'Access patient history',
          'Manage appointments',
        ],
        buttonText: 'Doctor Login',
        onPressed: () {
          context.push(
            '${AppRoutes.login}?role=doctor',
          );
        },
      ),

      _PortalData(
        icon: Icons.admin_panel_settings_rounded,
        title: 'Admin Portal',
        description:
            'Manage hospital operations, staff and system reports.',
        features: [
          'Manage patients',
          'Manage doctors',
          'View hospital reports',
        ],
        buttonText: 'Admin Login',
        onPressed: () {
          context.push(
            '${AppRoutes.login}?role=admin',
          );
        },
      ),
    ];

    if (isDesktop) {
      return IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: _PortalCard(
                data: cards[0],
              ),
            ),

            const SizedBox(width: 18),

            Expanded(
              child: _PortalCard(
                data: cards[1],
              ),
            ),

            const SizedBox(width: 18),

            Expanded(
              child: _PortalCard(
                data: cards[2],
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        _PortalCard(
          data: cards[0],
        ),

        const SizedBox(height: 16),

        _PortalCard(
          data: cards[1],
        ),

        const SizedBox(height: 16),

        _PortalCard(
          data: cards[2],
        ),
      ],
    );
  }

  Widget _buildInfoBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF4FA),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFD3E8F3),
        ),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.info_outline_rounded,
            color: primary,
            size: 25,
          ),

          SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Digital Healthcare Services',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: textDark,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  'Use this portal to reduce waiting time and access healthcare services digitally.',
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.4,
                    color: textLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return const Column(
      children: [
        Text(
          '© Government e-Hospital',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: textLight,
          ),
        ),

        SizedBox(height: 4),

        Text(
          'Public Healthcare Services • Secure • Accessible • Digital',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            color: Color(0xFF94A3B8),
          ),
        ),
      ],
    );
  }
}

class _PortalData {
  final IconData icon;
  final String title;
  final String description;
  final List<String> features;
  final String buttonText;
  final VoidCallback onPressed;

  const _PortalData({
    required this.icon,
    required this.title,
    required this.description,
    required this.features,
    required this.buttonText,
    required this.onPressed,
  });
}

class _PortalCard extends StatelessWidget {
  final _PortalData data;

  const _PortalCard({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: RoleSelectionScreen.border,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF4FA),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(
                  data.icon,
                  color: RoleSelectionScreen.primary,
                  size: 27,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  data.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: RoleSelectionScreen.textDark,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          SizedBox(
            height: 42,
            child: Text(
              data.description,
              style: const TextStyle(
                fontSize: 12.5,
                height: 1.45,
                color: RoleSelectionScreen.textLight,
              ),
            ),
          ),

          const SizedBox(height: 17),

          ...data.features.map(
            (feature) => Padding(
              padding: const EdgeInsets.only(
                bottom: 9,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.check_circle_rounded,
                    size: 17,
                    color: Color(0xFF2E7D32),
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: Text(
                      feature,
                      style: const TextStyle(
                        fontSize: 12,
                        color: RoleSelectionScreen.textDark,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Spacer(),

          const SizedBox(height: 9),

          SizedBox(
            width: double.infinity,
            height: 46,
            child: ElevatedButton(
              onPressed: data.onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: RoleSelectionScreen.primary,
                foregroundColor: Colors.white,
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.buttonText,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
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
        ],
      ),
    );
  }
}

class _SmallFeature extends StatelessWidget {
  final IconData icon;
  final String text;

  const _SmallFeature({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 16,
          color: RoleSelectionScreen.primary,
        ),

        const SizedBox(width: 5),

        Text(
          text,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: RoleSelectionScreen.textLight,
          ),
        ),
      ],
    );
  }
}