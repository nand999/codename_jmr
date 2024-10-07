import 'package:flutter/material.dart';
import 'package:jamur/components/customButton.dart';
import 'package:jamur/components/customPopup.dart';
import 'package:jamur/components/customTextField.dart';
import 'package:jamur/components/navbar.dart';

class UbahUsernamePage extends StatefulWidget {
  const UbahUsernamePage({super.key});

  @override
  State<UbahUsernamePage> createState() => _UbahUsernamePageState();
}

class _UbahUsernamePageState extends State<UbahUsernamePage> {
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNavbar(
        onLogoutTap: () {},
        titleText: "Ubah Username",
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
                'assets/images/gantiUsername.png',
                height: 150,
              ),
              const SizedBox(height: 30),

              CustomTextField(
                hintText: 'Username Baru',
                controller: _emailController,
              ),
              SizedBox(
                height: 50,
              ),
              CustomButton(
                text: 'Simpan',
                onPressed: () {},
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
