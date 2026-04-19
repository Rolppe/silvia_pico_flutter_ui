// ============================================================================
// main.dart
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/ui/views/home_view.dart';

// ============================================================================
// APP ENTRY POINT
// ============================================================================

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EspressoPico',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
