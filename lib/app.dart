import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/constants/app_routes.dart';
import 'core/theme/app_theme.dart';

import 'screens/splash/splash_screen.dart';

import 'screens/auth/role_selection_screen.dart';
import 'screens/auth/login_screen.dart';

import 'screens/patient/patient_dashboard.dart';
import 'screens/patient/registration_screen.dart';
import 'screens/patient/op_ticket_screen.dart';
import 'screens/patient/queue_screen.dart';
import 'screens/patient/doctor_screen.dart';
import 'screens/patient/ehr_screen.dart';
import 'screens/patient/lab_report_screen.dart';
import 'screens/patient/pharmacy_screen.dart';
import 'screens/patient/notifications_screen.dart';

import 'screens/doctor/doctor_dashboard.dart';
import 'screens/doctor/patient_list_screen.dart';
import 'screens/doctor/patient_history_screen.dart';

import 'screens/admin/admin_dashboard.dart';
import 'screens/admin/patient_management.dart';
import 'screens/admin/doctor_management.dart';
import 'screens/admin/department_management.dart';
import 'screens/admin/reports_screen.dart';

class GovernmentHospitalApp extends StatelessWidget {
  const GovernmentHospitalApp({super.key});

  GoRouter get router => GoRouter(
        initialLocation: AppRoutes.splash,
        routes: [
          GoRoute(
            path: AppRoutes.splash,
            builder: (context, state) =>
                const SplashScreen(),
          ),

          GoRoute(
            path: AppRoutes.roleSelection,
            builder: (context, state) =>
                const RoleSelectionScreen(),
          ),

          GoRoute(
            path: AppRoutes.login,
            builder: (context, state) =>
                const LoginScreen(),
          ),

          GoRoute(
            path: AppRoutes.registration,
            builder: (context, state) =>
                const RegistrationScreen(),
          ),

          // PATIENT ROUTES

          GoRoute(
            path: AppRoutes.patientDashboard,
            builder: (context, state) =>
                const PatientDashboard(),
          ),

          GoRoute(
            path: AppRoutes.opTicket,
            builder: (context, state) =>
                const OpTicketScreen(),
          ),

          GoRoute(
            path: AppRoutes.queue,
            builder: (context, state) =>
                const QueueScreen(),
          ),

          GoRoute(
            path: AppRoutes.doctorScreen,
            builder: (context, state) =>
                const DoctorScreen(),
          ),

          GoRoute(
            path: AppRoutes.ehr,
            builder: (context, state) =>
                const EhrScreen(),
          ),

          GoRoute(
            path: AppRoutes.labReport,
            builder: (context, state) =>
                const LabReportScreen(),
          ),

          GoRoute(
            path: AppRoutes.pharmacy,
            builder: (context, state) =>
                const PharmacyScreen(),
          ),

          GoRoute(
            path: AppRoutes.notifications,
            builder: (context, state) =>
                const NotificationsScreen(),
          ),

          // DOCTOR ROUTES

          GoRoute(
            path: AppRoutes.doctorDashboard,
            builder: (context, state) =>
                const DoctorDashboard(),
          ),

          GoRoute(
            path: AppRoutes.doctorPatientList,
            builder: (context, state) =>
                const PatientListScreen(),
          ),

          GoRoute(
            path: AppRoutes.patientHistory,
            builder: (context, state) =>
                const PatientHistoryScreen(),
          ),

          // ADMIN ROUTES

          GoRoute(
            path: AppRoutes.adminDashboard,
            builder: (context, state) =>
                const AdminDashboard(),
          ),

          GoRoute(
            path: AppRoutes.patientManagement,
            builder: (context, state) =>
                const PatientManagementScreen(),
          ),

          GoRoute(
            path: AppRoutes.doctorManagement,
            builder: (context, state) =>
                const DoctorManagementScreen(),
          ),

          GoRoute(
            path: AppRoutes.departmentManagement,
            builder: (context, state) =>
                const DepartmentManagementScreen(),
          ),

          GoRoute(
            path: AppRoutes.reports,
            builder: (context, state) =>
                const ReportsScreen(),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Govt Hospital Services',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}