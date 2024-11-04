import 'package:flutter/material.dart';
import 'package:jamur/backend/auth_service.dart';
import 'package:jamur/homePage.dart';
import 'package:jamur/lupaPage.dart';
import 'components/CustomTextField.dart';
import 'components/CustomButton.dart';
import 'components/CustomLoader.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isPasswordVisible = false; 
  final AuthService _authService = AuthService();

void _login() async {
  setState(() {
    _isLoading = true;
  });

  // Ambil username dan password dari form
  final username = _usernameController.text;
  final password = _passwordController.text;

  // Panggil method login untuk proses autentikasi
  bool loginSuccess = await _authService.login(username, password);

  if (mounted) {
    setState(() {
      _isLoading = false;
    });

    if (loginSuccess) {
      // Jika login berhasil, navigasi ke halaman HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Jika login gagal, tampilkan pesan kesalahan
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login gagal. Silakan cek kembali username dan password.'),
        ),
      );
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _isLoading
            ? const CustomLoader(message: 'Sedang Memuat...')
            : SingleChildScrollView(
                // Tambahkan SingleChildScrollView di sini
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                          height: 100),

                      // Logo Jamur
                      Image.asset(
                        'assets/images/jamur.png',
                        height: 150,
                      ),
                      const SizedBox(height: 30),

                      // Teks Login
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
                        controller: _usernameController,
                      ),
                      const SizedBox(height: 20),

                      // Input Password dengan ikon mata
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

                      // Tombol Login
                      CustomButton(
                        text: 'Masuk',
                        onPressed: _login,
                      ),
                      const SizedBox(height: 20),

                      // Tombol Sign Up
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Lupa kata sandi?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LupaPage()),
                              );
                            },
                            child: const Text(
                              'Klik Disini',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                          height: 50), // Tambahkan jarak dari bawah layar
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
