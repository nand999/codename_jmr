import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jamur/components/customCard.dart';
import 'package:jamur/components/navbar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jamur/config.dart';

class PemantauanPage extends StatefulWidget {
  const PemantauanPage({Key? key}) : super(key: key);

  @override
  _PemantauanPageState createState() => _PemantauanPageState();
}

class _PemantauanPageState extends State<PemantauanPage> {
  String waktu = '';
  String kategori = '';
  String akurasi = '';
  Timer? timer;

  // Fungsi untuk fetch data dari API
Future<void> fetchPrediksi() async {
  final response = await http.get(Uri.parse('${Config.apiUrl}/get_prediksi.php'));

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    if (jsonResponse['success']) {
      if (mounted) { // Tambahkan pengecekan ini
        setState(() {
          waktu = jsonResponse['data']['waktu'];
          kategori = jsonResponse['data']['kategori'];
          akurasi = jsonResponse['data']['akurasi'];
        });
      }
    } else {
      if (mounted) { // Tambahkan pengecekan ini juga di sini
        setState(() {
          waktu = 'Data tidak ditemukan';
          kategori = 'Tidak ada akurasi';
          akurasi = '0%';
        });
      }
    }
  } else {
    throw Exception('Failed to load prediction');
  }
}


  @override
  void initState() {
    super.initState();
    fetchPrediksi();
    timer = Timer.periodic(const Duration(seconds: 2), (Timer t) => fetchPrediksi());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNavbar(
        onLogoutTap: () {},
        titleText: "Pemantauan Langsung",
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blueAccent, width: 2),
              ),
              child: const Center(
                child: Icon(
                  Icons.image,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            const SizedBox(height: 10),
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
                      'Kondisi Jamur',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Waktu: $waktu',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Status: $kategori',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      kategori == 'sehat'
                          ? 'Jamur dalam kondisi sehat.'
                          : 'Jamur dalam kondisi kurang baik.',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Akurasi prediksi: $akurasi%',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
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
