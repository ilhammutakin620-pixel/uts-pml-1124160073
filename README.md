# UTS Pemrograman Mobile Lanjutan (Flutter)

Repository ini berisi hasil pengerjaan Ujian Tengah Semester (UTS) Ganjil Tahun Akademik 2026–2027 mata kuliah **Pemrograman Mobile Lanjutan** (Dosen: **IKetut Gunawan**).

---

## Identitas Mahasiswa

| Keterangan | Data |
| :--- | :--- |
| **Nama Lengkap** | Muhammad Ilham Muttaqim |
| **NIM** | `1124160073` |
| **Program Studi** | Teknik Informatika |
| **Kelas** | `TI 24 P SE 1` |
| **Email** | ilhammutakin620@gmail.com |
| **GitHub** | [github.com/ilhammutakin620-pixel](https://github.com/ilhammutakin620-pixel) |

---

## Link Penting

- **Repository GitHub**: https://github.com/ilhammutakin620-pixel/uts-pml-1124160073
- **Video Presentasi YouTube (5–10 menit)**: `[Tambahkan Link Video YouTube di sini]`
  - Judul Video: `UTS PML – Aplikasi Profil – Muhammad Ilham Muttaqim – 1124160073`
- **APK Release (`v1.0.0`)**: [Download app-release.apk (v1.0.0)](https://github.com/ilhammutakin620-pixel/uts-pml-1124160073/releases/tag/v1.0.0)

---

## Struktur Repository

```text
uts-pml-1124160073/
├── soal1_live_coding/          # Proyek Flutter Soal 1 (StatelessWidget Profil Mahasiswa)
├── soal2_profil_app/           # Proyek Flutter Soal 2 (Aplikasi Android Profil Mahasiswa)
│   └── lib/
│       ├── main.dart           # MaterialApp, tema terang/gelap, dan named routes
│       ├── app_routes.dart     # Konstanta nama route
│       ├── models/
│       │   └── profile.dart    # Model data Profile, AboutItem, EducationItem
│       ├── screens/
│       │   ├── login_page.dart         # Halaman Login (Form + validator, loading, pushReplacement)
│       │   ├── profile_page.dart       # Halaman Profil (CircleAvatar assets, Scaffold lengkap)
│       │   ├── edit_profile_page.dart  # Halaman Edit Profil (TextEditingController, validasi, pop)
│       │   └── about_page.dart         # Halaman Tentang Saya (ListView keahlian, hobi, pendidikan)
│       └── widgets/
│           ├── info_tile.dart          # Widget reusable InfoTile (ListTile + ikon)
│           └── theme_toggle_button.dart# Tombol switch mode terang/gelap
├── screenshots/                # Folder untuk menyimpan screenshot aplikasi Android
└── README.md                   # Dokumentasi utama repository
```

---

## Daftar Fitur (Soal 2 – `soal2_profil_app`)

1. **Halaman Login (`LoginPage`)**
   - Menggunakan `StatefulWidget`, `Form` + `validator` (email valid & password minimal 6 karakter).
   - Dilengkapi tombol show/hide password, proses loading asynchronous (`CircularProgressIndicator`), dan navigasi `Navigator.pushReplacementNamed` ke Halaman Profil.
2. **Halaman Profil (`ProfilePage`)**
   - Menampilkan foto profil dari `assets/images/profile.jpg` (didaftarkan di `pubspec.yaml`) di dalam `CircleAvatar`.
   - Menampilkan Nama Lengkap, NIM, Program Studi, Kelas, Bio Singkat, Informasi Akademik, serta Kontak (Email, Nomor HP, Akun GitHub) menggunakan `Card` + reusable `InfoTile` (`ListTile` berikon).
3. **Halaman Edit Profil (`EditProfilePage`)**
   - Form otomatis terisi data profil saat ini melalui `TextEditingController`.
   - Validasi input: **nama wajib diisi**, **email valid**, dan **nomor HP hanya angka 10–13 digit**.
   - Tombol **Simpan** mengembalikan `Profile` terbaru via `Navigator.pop(context, dataBaru)`, dan Halaman Profil langsung diperbarui dengan `setState()`.
4. **Halaman Tentang Saya (`AboutPage`)**
   - Menampilkan minimal 3 keahlian, hobi (Bermain Game & Bermain Badminton), serta riwayat pendidikan (`SMK 2020 - 2024` & `Institute Technology and Business Bina Sarana Global 2024 - Selesai`) menggunakan `ListView`.
5. **Scaffold Lengkap**
   - Menggunakan `AppBar`, `body`, `Drawer`, `NavigationBar` (`bottomNavigationBar`), dan `FloatingActionButton.extended`.
6. **Tema Terang & Mode Gelap (`theme`, `darkTheme`, `themeMode`)**
   - Skema warna kustom bernuansa Teal & Slate untuk mode terang dan gelap, lengkap dengan tombol/switch mode gelap yang langsung mengubah `themeMode`.
7. **Identitas Aplikasi Android**
   - Label aplikasi di `AndroidManifest.xml` diubah menjadi **`Profil Ilham`**.

---

## Cara Menjalankan Proyek

### 1. Menjalankan Soal 2 (`soal2_profil_app`)

```bash
cd soal2_profil_app
flutter pub get
flutter run
```

### 2. Menjalankan Pengujian & Analisis Kode

```bash
cd soal2_profil_app
flutter analyze
flutter test
```

### 3. Build APK Release (untuk GitHub Releases `v1.0.0`)

```bash
cd soal2_profil_app
flutter build apk --release
```

File APK hasil build berada di `soal2_profil_app/build/app/outputs/flutter-apk/app-release.apk` *(tidak di-commit ke repository, diunggah ke GitHub Releases tag `v1.0.0`)*.

### 4. Menjalankan Soal 1 (`soal1_live_coding`)

```bash
cd soal1_live_coding
flutter pub get
flutter run
```

---

## Screenshot Aplikasi

> Letakkan hasil tangkapan layar aplikasi dari HP/Emulator Android ke folder `screenshots/` lalu sesuaikan nama filenya jika diperlukan.

| Login | Profil Mahasiswa | Edit Profil |
| :---: | :---: | :---: |
| ![Screenshot Login](screenshots/login.png) | ![Screenshot Profil](screenshots/profil.png) | ![Screenshot Edit Profil](screenshots/edit_profil.png) |

| Tentang Saya | Mode Gelap |
| :---: | :---: |
| ![Screenshot Tentang Saya](screenshots/tentang_saya.png) | ![Screenshot Mode Gelap](screenshots/dark_mode.png) |
