import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jamur/DetailGambarPage.dart';
import 'dart:async';
import 'package:jamur/components/customCard.dart';
import 'package:jamur/components/navbar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jamur/config.dart'; // Import halaman detail gambar

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

  Future<void> fetchPrediksi() async {
    final response = await http.get(Uri.parse('${Config.apiUrl}/get_prediksi.php'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse['success']) {
        if (mounted) {
          setState(() {
            waktu = jsonResponse['data']['waktu'];
            kategori = jsonResponse['data']['kategori'];
            akurasi = jsonResponse['data']['akurasi'];
          });
        }
      } else {
        if (mounted) {
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

  String getFormattedDate() {
    final DateTime now = DateTime.now();
    final String day = now.day.toString();
    final String month = now.month.toString();
    final String year = now.year.toString();
    return '${day}_${month}_${year}';
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
    String formattedDate = getFormattedDate();
    String imageUrl = "${Config.apiUrl}/captured_images/$formattedDate.jpg";

    return Scaffold(
      appBar: CustomNavbar(
        onLogoutTap: () {SystemNavigator.pop();},
        titleText: "Pemantauan Langsung",
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailGambarPage(imageUrl: imageUrl),
                  ),
                );
              },
              child: Hero(
                tag: 'imageHero',
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blueAccent, width: 2),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text(
                        'Gambar tidak tersedia',
                        style: TextStyle(color: Colors.white),
                      );
                    },
                  ),
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
