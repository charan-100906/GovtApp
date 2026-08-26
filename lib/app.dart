import 'package:flutter/material.dart';
import 'core/constants/app_colors.dart';
import 'core/constants/app_routes.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Govt Hospital Services',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.background,
        ),
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.roleSelection: (context) => const RoleSelectionScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.patientDashboard: (context) => const PatientDashboard(),
        AppRoutes.registration: (context) => const RegistrationScreen(),
        AppRoutes.opTicket: (context) => const OpTicketScreen(),
        AppRoutes.queue: (context) => const QueueScreen(),
        AppRoutes.doctorScreen: (context) => const DoctorScreen(),
        AppRoutes.ehr: (context) => const EhrScreen(),
        AppRoutes.labReport: (context) => const LabReportScreen(),
        AppRoutes.pharmacy: (context) => const PharmacyScreen(),
        AppRoutes.notifications: (context) => const NotificationsScreen(),
        AppRoutes.doctorDashboard: (context) => const DoctorDashboard(),
        AppRoutes.doctorPatientList: (context) => const PatientListScreen(),
        AppRoutes.patientHistory: (context) => const PatientHistoryScreen(),
        AppRoutes.adminDashboard: (context) => const AdminDashboard(),
        AppRoutes.patientManagement: (context) => const PatientManagementScreen(),
        AppRoutes.doctorManagement: (context) => const DoctorManagementScreen(),
        AppRoutes.departmentManagement: (context) => const DepartmentManagementScreen(),
        AppRoutes.reports: (context) => const ReportsScreen(),
      },
    );
  }
}