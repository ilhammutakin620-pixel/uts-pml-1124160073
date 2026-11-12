import 'package:flutter/material.dart';

/// Item informasi untuk bagian keahlian dan hobi pada halaman Tentang Saya.
class AboutItem {
  final IconData icon;
  final String title;
  final String subtitle;

  const AboutItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

/// Item riwayat pendidikan mahasiswa.
class EducationItem {
  final String institusi;
  final String jenjang;
  final String periode;
  final String keterangan;

  const EducationItem({
    required this.institusi,
    required this.jenjang,
    required this.periode,
    required this.keterangan,
  });
}

/// Model data profil mahasiswa yang disimpan di memori aplikasi.
class Profile {
  final String nama;
  final String nim;
  final String prodi;
  final String kelas;
  final String bio;
  final String email;
  final String hp;
  final String github;
  final String avatarAsset;
  final List<AboutItem> keahlian;
  final List<AboutItem> hobi;
  final List<EducationItem> riwayatPendidikan;

  const Profile({
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.kelas,
    required this.bio,
    required this.email,
    required this.hp,
    required this.github,
    required this.avatarAsset,
    required this.keahlian,
    required this.hobi,
    required this.riwayatPendidikan,
  });

  /// Mengembalikan salinan [Profile] dengan field tertentu yang diperbarui.
  Profile copyWith({
    String? nama,
    String? nim,
    String? prodi,
    String? kelas,
    String? bio,
    String? email,
    String? hp,
    String? github,
    String? avatarAsset,
    List<AboutItem>? keahlian,
    List<AboutItem>? hobi,
    List<EducationItem>? riwayatPendidikan,
  }) {
    return Profile(
      nama: nama ?? this.nama,
      nim: nim ?? this.nim,
      prodi: prodi ?? this.prodi,
      kelas: kelas ?? this.kelas,
      bio: bio ?? this.bio,
      email: email ?? this.email,
      hp: hp ?? this.hp,
      github: github ?? this.github,
      avatarAsset: avatarAsset ?? this.avatarAsset,
      keahlian: keahlian ?? this.keahlian,
      hobi: hobi ?? this.hobi,
      riwayatPendidikan: riwayatPendidikan ?? this.riwayatPendidikan,
    );
  }

  /// Data default mahasiswa untuk inisialisasi awal aplikasi.
  factory Profile.defaultStudent() {
    return const Profile(
      nama: 'Muhammad Ilham Muttaqim',
      nim: '1124160073',
      prodi: 'Teknik Informatika',
      kelas: 'TI 24 P SE 1',
      bio:
          'Mahasiswa Teknik Informatika peminatan Software Engineering yang antusias membangun aplikasi mobile Flutter dengan desain modern dan kode terstruktur.',
      email: 'ilhammutakin620@gmail.com',
      hp: '085693446971',
      github: 'github.com/ilhammutakin620-pixel',
      avatarAsset: 'assets/images/profile.jpg',
      keahlian: [
        AboutItem(
          icon: Icons.phone_android_rounded,
          title: 'Flutter & Dart Development',
          subtitle:
              'Pengembangan antarmuka mobile Material 3, manajemen state, dan navigasi multi-halaman.',
        ),
        AboutItem(
          icon: Icons.design_services_rounded,
          title: 'UI/UX Mobile Design',
          subtitle:
              'Perancangan tata letak responsif, hierarki visual, dan dukungan tema terang maupun gelap.',
        ),
        AboutItem(
          icon: Icons.code_rounded,
          title: 'Software Engineering & Git',
          subtitle:
              'Pemisahan struktur kode modular, validasi form, dan kolaborasi version control GitHub.',
        ),
      ],
      hobi: [
        AboutItem(
          icon: Icons.sports_esports_rounded,
          title: 'Bermain Game',
          subtitle:
              'Melatih strategi, konsentrasi, dan kerja sama tim di waktu luang.',
        ),
        AboutItem(
          icon: Icons.sports_tennis_rounded,
          title: 'Bermain Badminton',
          subtitle:
              'Menjaga kebugaran fisik, refleks, dan sportivitas secara rutin.',
        ),
      ],
      riwayatPendidikan: [
        EducationItem(
          institusi: 'SMK',
          jenjang: 'Sekolah Menengah Kejuruan',
          periode: '2020 - 2024',
          keterangan: 'Pendidikan kejuruan sebagai fondasi minat di bidang teknologi.',
        ),
        EducationItem(
          institusi: 'Institute Technology and Business Bina Sarana Global',
          jenjang: 'S1 Teknik Informatika (Software Engineering)',
          periode: '2024 - Selesai',
          keterangan: 'Mahasiswa aktif kelas TI 24 P SE 1 (NIM 1124160073).',
        ),
      ],
    );
  }
}
