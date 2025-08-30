import 'package:flutter/material.dart';
import 'package:reminders/screens/login.dart';
import 'package:reminders/widgets/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,

      home: LoginScreen(),
    );
  }
}
