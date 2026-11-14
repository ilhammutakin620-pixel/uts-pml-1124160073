import 'package:flutter/material.dart';

import 'app_routes.dart';
import 'screens/about_page.dart';
import 'screens/edit_profile_page.dart';
import 'screens/login_page.dart';
import 'screens/profile_page.dart';

void main() {
  runApp(const MyApp());
}

/// Root aplikasi Profil Mahasiswa dengan pengaturan tema terang/gelap
/// dan definisi named routes.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme() {
    setState(() {
      final platformBrightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      final isCurrentlyDark = _themeMode == ThemeMode.dark ||
          (_themeMode == ThemeMode.system &&
              platformBrightness == Brightness.dark);
      _themeMode = isCurrentlyDark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  ThemeData _buildLightTheme() {
    const seedColor = Color(0xFF0F766E);
    final colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.light,
      secondary: const Color(0xFF1D4ED8),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: const Color(0xFFF3F6F9),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      cardTheme: CardThemeData(
        elevation: 1,
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: colorScheme.outlineVariant.withValues(alpha: 0.5),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerLowest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    const seedColor = Color(0xFF14B8A6);
    final colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark,
      secondary: const Color(0xFF60A5FA),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: const Color(0xFF0B1320),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF111B2E),
      ),
      cardTheme: CardThemeData(
        elevation: 1,
        color: const Color(0xFF152033),
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: colorScheme.outlineVariant.withValues(alpha: 0.35),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1A2740),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Ilham',
      debugShowCheckedModeBanner: false,
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      themeMode: _themeMode,
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => LoginPage(
              onToggleTheme: _toggleTheme,
            ),
        AppRoutes.profile: (context) => ProfilePage(
              onToggleTheme: _toggleTheme,
            ),
        AppRoutes.editProfile: (context) => const EditProfilePage(),
        AppRoutes.about: (context) => AboutPage(
              onToggleTheme: _toggleTheme,
            ),
      },
    );
  }
}
