import 'package:flutter/material.dart';

import '../app_routes.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';
import '../widgets/theme_toggle_button.dart';
import 'about_page.dart';

/// Halaman utama Profil Mahasiswa setelah login.
/// Menggunakan Scaffold lengkap (AppBar, Drawer, BottomNavigationBar,
/// dan FloatingActionButton) serta menerima pembaruan data via Navigator + setState.
class ProfilePage extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const ProfilePage({
    super.key,
    required this.onToggleTheme,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile _profile = Profile.defaultStudent();
  int _selectedIndex = 0;

  Future<void> _openEditProfile() async {
    final result = await Navigator.pushNamed(
      context,
      AppRoutes.editProfile,
      arguments: _profile,
    );

    if (!mounted) return;

    if (result is Profile) {
      setState(() {
        _profile = result;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data profil berhasil diperbarui'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _logout() {
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? 'Profil Mahasiswa' : 'Tentang Saya'),
        actions: [
          ThemeToggleButton(onToggleTheme: widget.onToggleTheme),
          IconButton(
            tooltip: 'Edit Profil',
            onPressed: _openEditProfile,
            icon: const Icon(Icons.edit_outlined),
          ),
        ],
      ),
      drawer: _buildDrawer(context, isDark),
      body: SafeArea(
        child: _selectedIndex == 0
            ? _buildProfileBody(context)
            : AboutContent(profile: _profile),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profil',
          ),
          NavigationDestination(
            icon: Icon(Icons.info_outline_rounded),
            selectedIcon: Icon(Icons.info_rounded),
            label: 'Tentang Saya',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openEditProfile,
        icon: const Icon(Icons.edit_rounded),
        label: const Text('Edit Profil'),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context, bool isDark) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colorScheme.primary,
                  colorScheme.primaryContainer,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: colorScheme.surface,
                  child: CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(_profile.avatarAsset),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  _profile.nama,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${_profile.nim} • ${_profile.kelas}',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onPrimary.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline_rounded),
            title: const Text('Profil Saya'),
            selected: _selectedIndex == 0,
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _selectedIndex = 0;
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit_outlined),
            title: const Text('Edit Profil'),
            onTap: () {
              Navigator.pop(context);
              _openEditProfile();
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline_rounded),
            title: const Text('Tentang Saya'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                AppRoutes.about,
                arguments: _profile,
              );
            },
          ),
          const Divider(),
          SwitchListTile(
            secondary: Icon(
              isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
            ),
            title: const Text('Mode Gelap'),
            value: isDark,
            onChanged: (_) => widget.onToggleTheme(),
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.logout_rounded, color: colorScheme.error),
            title: Text(
              'Keluar',
              style: TextStyle(
                color: colorScheme.error,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              _logout();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileBody(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 58,
                    backgroundColor: colorScheme.primary,
                    child: CircleAvatar(
                      radius: 54,
                      backgroundImage: AssetImage(_profile.avatarAsset),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _profile.nama,
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _ProfileBadge(
                        icon: Icons.badge_outlined,
                        text: _profile.nim,
                      ),
                      _ProfileBadge(
                        icon: Icons.school_outlined,
                        text: _profile.prodi,
                      ),
                      _ProfileBadge(
                        icon: Icons.class_outlined,
                        text: _profile.kelas,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.format_quote_rounded,
                        color: colorScheme.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Bio Singkat',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _profile.bio,
                    style: textTheme.bodyMedium?.copyWith(
                      height: 1.5,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: Text(
                      'Informasi Akademik',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InfoTile(
                    icon: Icons.badge_outlined,
                    label: 'NIM',
                    value: _profile.nim,
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  InfoTile(
                    icon: Icons.school_outlined,
                    label: 'Program Studi',
                    value: _profile.prodi,
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  InfoTile(
                    icon: Icons.class_outlined,
                    label: 'Kelas',
                    value: _profile.kelas,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: Text(
                      'Kontak',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InfoTile(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    value: _profile.email,
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  InfoTile(
                    icon: Icons.phone_android_outlined,
                    label: 'Nomor HP',
                    value: _profile.hp,
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  InfoTile(
                    icon: Icons.code_rounded,
                    label: 'Akun GitHub',
                    value: _profile.github,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileBadge extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ProfileBadge({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: colorScheme.onPrimaryContainer),
          const SizedBox(width: 5),
          Text(
            text,
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
