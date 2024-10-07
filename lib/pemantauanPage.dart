import 'package:flutter/material.dart';
import 'package:jamur/components/customCard.dart';
import 'package:jamur/components/navbar.dart';

class PemantauanPage extends StatelessWidget {
  const PemantauanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNavbar(onLogoutTap: (){}, titleText: "Pemantauan Langsung",),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Live View Kamera
            Container(
              height: 200, // Atur tinggi untuk video feed
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blueAccent, width: 2),
              ),
              child: Center(
                child: Icon(
                  Icons.videocam,
                  color: Colors.white,
                  size: 50,
                ), // Ini hanya simulasi, bisa diganti dengan widget video stream dari kamera
              ),
            ),
            const SizedBox(height: 10),
            // Keterangan Kondisi Jamur
            CustomCard(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kondisi Jamur:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Status: Siap Panen', // Ubah status sesuai hasil deteksi
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Keterangan: Jamur dalam kondisi sehat dan siap dipanen.',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
