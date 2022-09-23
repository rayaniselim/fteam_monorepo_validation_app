import 'package:flutter/material.dart';
import 'package:fteam_firebase_login_app/screens/login_screen/login_screen.dart';
import 'package:fteam_firebase_login_app/screens/profile_settings_screen/profile_settings_screen.dart';
import 'package:fteam_firebase_login_app/screens/screen_finish/screen_finish.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';
import 'screens/cadestre_screen/cadestre_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeLight,
        themeMode: ThemeMode.light,
        initialRoute: '/login',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(builder: (_) => const LoginScreen());
            case '/cadestre':
              return MaterialPageRoute(builder: (_) => const CadestreScreen());
            case '/profile':
              return MaterialPageRoute(
                  builder: (_) => const ProfileSettingsScreen());
            case '/finish':
            default:
              return MaterialPageRoute(builder: (_) => const ScreenFinish());
          }
        });
  }
}
