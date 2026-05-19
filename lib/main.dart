import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:morjops/providers/jobs_provider.dart';
import 'package:morjops/providers/auth_provider.dart';
import 'package:morjops/screens/home_screen.dart';
import 'package:morjops/screens/login_screen.dart';
import 'package:morjops/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => JobsProvider()),
      ],
      child: MaterialApp(
        title: 'MorJops',
        theme: AppTheme.lightTheme,
        home: Consumer<AuthProvider>(
          builder: (context, authProvider, _) {
            return authProvider.isLoggedIn ? const HomeScreen() : const LoginScreen();
          },
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
