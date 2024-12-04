import 'package:flutter/material.dart';

class DetailGambarPage extends StatelessWidget {
  final String imageUrl;

  const DetailGambarPage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.pop(context), // Kembali ke halaman sebelumnya
        child: Hero(
          tag: 'imageHero',
          child: Center(
            child: Image.network(
              imageUrl,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Text(
                  'Gambar tidak tersedia',
                  style: TextStyle(color: Colors.grey),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
