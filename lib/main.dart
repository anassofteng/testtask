import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/navbar/navbar_screen.dart';

void main() {
  runApp(const CalenderApp());
}

class CalenderApp extends StatelessWidget {
  const CalenderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calender',
      theme: AppTheme.darkTheme,
      home: const NavBarScreen(),
    );
  }
}
