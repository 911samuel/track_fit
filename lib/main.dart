import 'package:flutter/material.dart';
import 'package:track_fit/ui/splash/initial_screen.dart';
import 'core/theme/app_theme.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

void main() {
  runApp(const ProviderScope(child: FitTrackApp()));
}

class FitTrackApp extends StatelessWidget {
  const FitTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Tracker',
      theme: AppTheme.darkTheme,
      home: const InitialScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
