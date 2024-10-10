import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:meals/screens/tabs.dart';

/// Sets the theme for the application
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

/// Main method
void main() {
  runApp(const App());
}

/// The actual application widget.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
