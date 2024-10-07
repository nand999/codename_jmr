import 'package:flutter/material.dart';
import 'package:jamur/components/navbar.dart';
import 'package:jamur/components/customButton.dart';
import 'package:jamur/ubahPage.dart';
import 'package:jamur/ubahUsername.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNavbar(
        onLogoutTap: () {},
        titleText: "Pengaturan",
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(16.0), // Menambahkan padding di sekitar konten
        child: ListView(
          children: [
            const SizedBox(height: 20), // Jarak atas
            CustomButton(
              text: "Ubah Username",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UbahUsernamePage()),
                );
              },
            ),
            const SizedBox(height: 16), // Jarak antara tombol
            CustomButton(
              text: "Ubah Kata Sandi",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UbahPage()),
                );
              },
            ),
            // const SizedBox(height: 16),
            // CustomButton(
            //   text: "Akun",
            //   onPressed: () {
            //     // Aksi untuk pengaturan akun
            //   },
            // ),
            // const SizedBox(height: 16),
            // CustomButton(
            //   text: "Tentang Aplikasi",
            //   onPressed: () {
            //     // Aksi untuk informasi tentang aplikasi
            //   },
            // ),
            // const SizedBox(height: 16),
            // CustomButton(
            //   text: "Bantuan",
            //   onPressed: () {
            //     // Aksi untuk bantuan
            //   },
            // ),
            // const SizedBox(height: 16),
            // CustomButton(
            //   text: "Keluar",
            //   onPressed: () {
            //     // Aksi untuk keluar
            //   },
            //   color: Colors.red, // Ubah warna untuk tombol keluar
            // ),
          ],
        ),
      ),
    );
  }
}
