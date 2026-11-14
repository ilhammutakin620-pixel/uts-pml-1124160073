import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:soal2_profil_app/main.dart';

void main() {
  testWidgets('Alur lengkap Login, Profil, Edit Profil, Tentang Saya, dan Dark Mode',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // 1. Login gagal karena validasi kosong
    expect(find.text('Login Mahasiswa'), findsOneWidget);
    await tester.tap(find.text('Masuk'));
    await tester.pumpAndSettle();

    expect(find.text('Email wajib diisi'), findsOneWidget);
    expect(find.text('Password wajib diisi'), findsOneWidget);

    // 2. Login gagal karena email tidak valid & password pendek
    final emailField = find.widgetWithText(TextFormField, 'Email');
    final passwordField = find.widgetWithText(TextFormField, 'Password');

    await tester.enterText(emailField, 'bukan-email');
    await tester.enterText(passwordField, '123');
    await tester.tap(find.text('Masuk'));
    await tester.pumpAndSettle();

    expect(find.text('Format email tidak valid'), findsOneWidget);
    expect(find.text('Password minimal 6 karakter'), findsOneWidget);

    // 3. Login berhasil -> loading -> pushReplacement ke ProfilePage
    await tester.enterText(emailField, 'ilhammutakin620@gmail.com');
    await tester.enterText(passwordField, '123456');
    await tester.tap(find.text('Masuk'));
    await tester.pump();
    expect(find.text('Memproses...'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 1300));
    await tester.pumpAndSettle();

    expect(find.text('Profil Mahasiswa'), findsOneWidget);
    expect(find.text('Muhammad Ilham Muttaqim'), findsOneWidget);
    expect(find.text('1124160073'), findsWidgets);
    expect(find.text('TI 24 P SE 1'), findsWidgets);
    expect(find.text('ilhammutakin620@gmail.com'), findsOneWidget);
    expect(find.text('085693446971'), findsOneWidget);

    // 4. Toggle dark mode mengubah ThemeMode langsung
    final darkModeBtn = find.byIcon(Icons.dark_mode_rounded);
    expect(darkModeBtn, findsOneWidget);
    await tester.tap(darkModeBtn);
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.light_mode_rounded), findsOneWidget);

    // 5. Buka Tentang Saya via NavigationBar
    await tester.tap(find.text('Tentang Saya').last);
    await tester.pumpAndSettle();
    expect(find.text('Keahlian'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Hobi & Minat'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Hobi & Minat'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Bermain Badminton'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Bermain Badminton'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Riwayat Pendidikan'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Riwayat Pendidikan'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Institute Technology and Business Bina Sarana Global'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    expect(
      find.text('Institute Technology and Business Bina Sarana Global'),
      findsOneWidget,
    );

    // Kembali ke tab Profil
    await tester.tap(find.text('Profil'));
    await tester.pumpAndSettle();

    // 6. Buka Edit Profil via FloatingActionButton
    await tester.tap(find.text('Edit Profil'));
    await tester.pumpAndSettle();
    expect(find.text('Simpan'), findsOneWidget);

    // Uji validasi Edit Profil: nama kosong, email salah, nomor HP salah
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Nama Lengkap'),
      '',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Email'),
      'email-salah',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Nomor HP'),
      '0812abc',
    );
    await tester.ensureVisible(find.text('Simpan'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();

    expect(find.text('Nama lengkap wajib diisi'), findsOneWidget);
    expect(find.text('Format email tidak valid'), findsOneWidget);
    expect(find.text('Nomor HP hanya boleh berisi angka'), findsOneWidget);

    // Uji validasi panjang digit nomor HP (< 10 digit)
    final hpField = find.widgetWithText(TextFormField, 'Nomor HP');
    await tester.ensureVisible(hpField);
    await tester.pumpAndSettle();
    await tester.enterText(hpField, '08123');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('Simpan'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();
    expect(find.text('Nomor HP harus terdiri dari 10-13 digit'), findsOneWidget);

    // Isi data valid dan Simpan -> kembali ke ProfilePage dan ter-update
    final namaField = find.widgetWithText(TextFormField, 'Nama Lengkap');
    await tester.ensureVisible(namaField);
    await tester.pumpAndSettle();
    await tester.enterText(namaField, 'M. Ilham Muttaqim');

    final editEmailField = find.widgetWithText(TextFormField, 'Email');
    await tester.ensureVisible(editEmailField);
    await tester.pumpAndSettle();
    await tester.enterText(editEmailField, 'ilham.baru@gmail.com');

    await tester.ensureVisible(hpField);
    await tester.pumpAndSettle();
    await tester.enterText(hpField, '085693446972');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    final saveButton = find.widgetWithText(FilledButton, 'Simpan');
    await tester.ensureVisible(saveButton);
    await tester.pumpAndSettle();
    await tester.tap(saveButton);
    await tester.pumpAndSettle();

    // Pastikan sudah kembali ke ProfilePage (bukan masih di EditProfilePage)
    expect(find.text('Profil Mahasiswa'), findsOneWidget);
    expect(find.text('M. Ilham Muttaqim'), findsOneWidget);
    expect(find.text('ilham.baru@gmail.com'), findsOneWidget);
    expect(find.text('085693446972'), findsOneWidget);

    // 7. Uji Drawer -> navigasi named route '/about'
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(
      find.descendant(
        of: find.byType(Drawer),
        matching: find.text('Tentang Saya'),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Tentang Saya'), findsOneWidget);
    expect(find.text('Keahlian'), findsOneWidget);
  });
}
