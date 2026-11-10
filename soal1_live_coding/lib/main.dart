import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Muhammad Ilham Muttaqim',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.person, size: 55),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Muhammad Ilham Muttaqim',
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                'NIM: 1124160073',
                style: textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                'Program Studi: Teknik Informatika',
                style: textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: const [
                      InfoTile(
                        icon: Icons.email_outlined,
                        label: 'Email',
                        value: 'ilham@global.ac.id',
                      ),
                      Divider(height: 1),
                      InfoTile(
                        icon: Icons.phone_android_outlined,
                        label: 'Nomor HP',
                        value: '0812-3456-7890',
                      ),
                      Divider(height: 1),
                      InfoTile(
                        icon: Icons.school_outlined,
                        label: 'Kelas',
                        value: 'TI-2024-A',
                      ),
                      Divider(height: 1),
                      InfoTile(
                        icon: Icons.code_outlined,
                        label: 'GitHub',
                        value: 'github.com/ilhammutakin620-pixel',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: const [
                      InfoTile(
                        icon: Icons.flutter_dash,
                        label: 'Keahlian Utama',
                        value: 'Flutter & Dart Basics',
                      ),
                      Divider(height: 1),
                      InfoTile(
                        icon: Icons.palette_outlined,
                        label: 'Minat Desain',
                        value: 'UI/UX Mobile Design',
                      ),
                      Divider(height: 1),
                      InfoTile(
                        icon: Icons.sports_esports_outlined,
                        label: 'Hobi',
                        value: 'Gaming & Membaca Buku',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Terima kasih telah melihat profil saya'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        child: const Icon(Icons.thumb_up_outlined),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}