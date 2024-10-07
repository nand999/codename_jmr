import 'package:flutter/material.dart';
import 'package:jamur/components/customButton.dart';
import 'package:jamur/components/customTextField.dart';
import 'package:jamur/components/navbar.dart';

class LupaPage extends StatefulWidget {
  const LupaPage({super.key});

  @override
  State<LupaPage> createState() => _LupaPageState();
}

class _LupaPageState extends State<LupaPage> {
  final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNavbar(
        onLogoutTap: () {},
        titleText: "Lupa Sandi",
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
                'assets/images/tanya.png',
                height: 150,
              ),
              const SizedBox(height: 30),

              // // Teks Login
              // const Text(
              //   'Login',
              //   style: TextStyle(
              //     fontSize: 32,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.blue,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
              const SizedBox(height: 30),

              // Input Email
              CustomTextField(
                hintText: 'Nama pengguna',
                controller: _emailController,
              ),
              const SizedBox(height: 20),

              CustomTextField(
                hintText: 'Email',
                controller: _emailController,
              ),

              // Input Password dengan ikon mata

              // TextField(
              //   controller: _passwordController,
              //   obscureText: !_isPasswordVisible,
              //   decoration: InputDecoration(
              //     hintText: 'Kata sandi',
              //     contentPadding: const EdgeInsets.symmetric(
              //         vertical: 15.0, horizontal: 20.0),
              //     filled: true,
              //     fillColor: Colors.grey[200],
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       borderSide: BorderSide.none,
              //     ),
              //     suffixIcon: IconButton(
              //       icon: Icon(
              //         _isPasswordVisible
              //             ? Icons.visibility
              //             : Icons.visibility_off,
              //       ),
              //       onPressed: () {
              //         setState(() {
              //           _isPasswordVisible = !_isPasswordVisible;
              //         });
              //       },
              //     ),
              //   ),
              // ),
              const SizedBox(height: 30),

              // Tombol Login
              CustomButton(
                text: 'Selanjutnya',
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
