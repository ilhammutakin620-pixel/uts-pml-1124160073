# Proyek Profil Mahasiswa (Soal 2)

Aplikasi profil mahasiswa berbasis Flutter untuk tugas UTS Pemrograman Mobile Lanjutan.

## Identitas Mahasiswa
- **Nama**: Muhammad Ilham Muttaqim
- **NIM**: 1124160073
- **Kelas**: TI 24 P SE 1
- **Program Studi**: Teknik Informatika
- **Konsentrasi**: Software Engineering

## Daftar Fitur
1. **Halaman Login**: Form validasi email dan password, toggle visibilitas password, indikator loading asynchronous, dan navigasi `pushReplacement`.
2. **Halaman Profil**: Menampilkan foto profil dari assets (`assets/images/profile.jpg`) dengan `CircleAvatar`, ringkasan identitas, bio singkat, informasi akademik, dan kontak (`Card` + `InfoTile`).
3. **Halaman Edit Profil**: Form otomatis terisi data awal (`TextEditingController`), validasi nama wajib diisi, email valid, nomor HP 10–13 digit angka, serta pengembalian data via `Navigator.pop(context, dataBaru)`.
4. **Halaman Tentang Saya**: Menampilkan daftar keahlian, hobi, dan riwayat pendidikan menggunakan `ListView`.
5. **Scaffold Lengkap**: Menggunakan `AppBar`, `Drawer`, `bottomNavigationBar` (`NavigationBar`), dan `FloatingActionButton`.
6. **Tema Terang & Gelap**: Skema warna kustom (Teal & Slate) dengan tombol toggle mode gelap yang langsung mengubah `themeMode`.
7. **Identitas Aplikasi Android**: Label aplikasi di Android diubah menjadi **Profil Ilham**.

## Cara Menjalankan Aplikasi
1. Mengambil dependensi:
   ```bash
   flutter pub get
   ```
2. Menjalankan di emulator / HP Android:
   ```bash
   flutter run
   ```
