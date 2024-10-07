import 'package:flutter/material.dart';
import 'package:jamur/components/customButton.dart';
import 'package:jamur/components/customPopup.dart';
import 'package:jamur/components/customTextField.dart';
import 'package:jamur/components/navbar.dart';

class UbahPage extends StatefulWidget {
  const UbahPage({super.key});

  @override
  State<UbahPage> createState() => _UbahPageState();
}

class _UbahPageState extends State<UbahPage> {
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNavbar(
        onLogoutTap: () {},
        titleText: "Ubah Sandi",
      ),
      body: SingleChildScrollView(
        // Tambahkan SingleChildScrollView di sini
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50), // Tambahkan jarak dari atas layar

              // Logo Jamur
              Image.asset(
                'assets/images/gantiSandi.png',
                height: 150,
              ),
              const SizedBox(height: 30),

              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Kata sandi',
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20.0),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Konfirmasi Kata sandi',
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20.0),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              CustomButton(
                text: 'Selanjutnya',
                onPressed: () {
                  if (_passwordController.text !=
                      _confirmPasswordController.text) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomPopup(
                          title: 'Gagal mengubah sandi',
                          content:
                              'Kata sandi dan konfirmasi kata sandi tidak sesuai',
                          buttonText: 'OK',
                          onButtonPressed: () {
                            
                          },
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomPopup(
                          title: 'Yakin untuk mengubah sandi',
                          content: 'Apakah anda yakin mengubah sandi?',
                          buttonText: 'Tidak',
                          secondButtonText: 'Ya',
                          onButtonPressed: () {
                            // Navigator.of(context).pop(); // Menutup dialog
                            // // Lakukan aksi untuk mengubah sandi di sini
                          },
                          onSecondButtonPressed: () {
                            // Navigator.of(context).pop(); // Menutup dialog
                            // // Lakukan aksi untuk mengubah sandi di sini
                          },
                        );
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 50), // Tambahkan jarak dari bawah layar
            ],
          ),
        ),
      ),
    );
  }
}
