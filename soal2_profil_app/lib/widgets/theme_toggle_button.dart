import 'package:flutter/material.dart';

/// Tombol ikon reusable untuk mengganti mode terang dan gelap secara langsung.
class ThemeToggleButton extends StatelessWidget {
  final VoidCallback onToggleTheme;

  const ThemeToggleButton({
    super.key,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return IconButton(
      tooltip: isDark ? 'Aktifkan Mode Terang' : 'Aktifkan Mode Gelap',
      onPressed: onToggleTheme,
      icon: Icon(
        isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
      ),
    );
  }
}
