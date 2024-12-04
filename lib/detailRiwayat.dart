import 'package:flutter/material.dart';
import 'package:jamur/config.dart';

class DetailRiwayatPage extends StatelessWidget {
  final String formattedDate;

  const DetailRiwayatPage({Key? key, required this.formattedDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageUrl = "${Config.apiUrl}/captured_images/$formattedDate.jpg";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Riwayat"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Foto Jamur: $formattedDate",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Image.network(
              imageUrl,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const CircularProgressIndicator();
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return const Text("Gambar tidak ditemukan");
              },
            ),
          ],
        ),
      ),
    );
  }
}
