import 'package:flutter/material.dart';
import 'package:jamur/components/customButtonCard.dart';
import 'package:jamur/components/customHorizontalCard.dart';
import 'package:jamur/components/customPopup.dart';
import 'components/Navbar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  double currentTemperature = 24.5; // Suhu saat ini dalam Celsius
  double currentHumidity = 75; // Kelembapan saat ini dalam persentase
  bool isLampOn = false; // Status lampu
  bool isFanOn = false; // Status kipas

  final List<ChartData> chartData = [
    ChartData('Hari 1', 23, 70),
    ChartData('Hari 2', 25, 65),
    ChartData('Hari 3', 24, 72),
    ChartData('Hari 4', 26, 68),
    ChartData('Hari 5', 27, 75),
    ChartData('Hari 6', 28, 73),
    ChartData('Hari 7', 24, 70),
  ];

  void _waterMushroomFarm() {
    showDialog(
      context: context,
      builder: (context) {
        return CustomPopup(
          title: 'Penyiraman Berhasil',
          content: 'Kumbung jamur telah disiram.',
          buttonText: 'OK',
          onButtonPressed: () {
            // Aksi setelah penyiraman
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Color(0xFFB2FEFA), ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFB2FEFA), // Warna biru muda yang lembut
              Color(0xFF0ED2F7), // Warna biru yang lebih tajam
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Card untuk kondisi kumbung jamur
              Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Kondisi Kumbung Jamur Saat Ini:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Kotak untuk Suhu
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: const EdgeInsets.all(20.0),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                const Icon(Icons.thermostat,
                                    size: 50, color: Colors.blue),
                                const SizedBox(height: 10),
                                const Text(
                                  'Suhu:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '$currentTemperature°C',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          // Kotak untuk Kelembapan
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: const EdgeInsets.all(20.0),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                const Icon(Icons.water_drop,
                                    size: 50, color: Colors.blue),
                                const SizedBox(height: 10),
                                const Text(
                                  'Kelembapan:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '$currentHumidity%',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Card untuk grafik suhu dan kelembapan
              Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Riwayat Suhu dan Kelembapan (7 Hari Terakhir)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        legend: Legend(isVisible: true),
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <CartesianSeries<ChartData, String>>[
                          LineSeries<ChartData, String>(
                            dataSource: chartData,
                            xValueMapper: (ChartData data, _) => data.day,
                            yValueMapper: (ChartData data, _) =>
                                data.temperature,
                            name: 'Suhu (°C)',
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: true),
                          ),
                          LineSeries<ChartData, String>(
                            dataSource: chartData,
                            xValueMapper: (ChartData data, _) => data.day,
                            yValueMapper: (ChartData data, _) => data.humidity,
                            name: 'Kelembapan (%)',
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: true),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // // Tombol Penyiraman
              // ElevatedButton.icon(
              //   onPressed: _waterMushroomFarm,
              //   icon: const Icon(Icons.water_damage, color: Colors.blue),
              //   label: const Text(
              //     'Sirami Kumbung Jamur',
              //     style: TextStyle(color: Colors.blue),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     padding: const EdgeInsets.symmetric(vertical: 15),
              //     textStyle: const TextStyle(fontSize: 18),
              //   ),
              // ),

              CustomButtonCard(
                logoPath: 'assets/images/jamur.png',
                label: 'Sirami Kumbung Jamur',
                onPressed: _waterMushroomFarm,
              ),

              const SizedBox(height: 20),

              // Card Horizontal untuk Lampu
              Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Label Lampu
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Lampu',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Status: Mati/Hidup',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      // Switch Lampu
                      Switch(
                        value: isLampOn, // status switch (true/false)
                        onChanged: (bool value) {
                          setState(() {
                            isLampOn = value; // Ganti status switch
                            // Tambahkan fungsi untuk mengontrol lampu di sini
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // Card Horizontal untuk Kipas
              Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Label Kipas
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Kipas',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Status: Mati/Hidup',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      // Switch Kipas
                      Switch(
                        value: isFanOn, // status switch (true/false)
                        onChanged: (bool value) {
                          setState(() {
                            isFanOn = value; // Ganti status switch
                            // Tambahkan fungsi untuk mengontrol kipas di sini
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              CustomHorizontalCard(
                logoPath: 'assets/images/jamur.png',
                label: 'Lampu',
                switchValue: isLampOn,
                onToggle: (value) {
                  setState(() {
                    isLampOn = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomHorizontalCard(
                logoPath: 'assets/images/jamur.png',
                label: 'Kipas',
                switchValue: isFanOn,
                onToggle: (value) {
                  setState(() {
                    isFanOn = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Class untuk data chart (suhu dan kelembapan)
class ChartData {
  ChartData(this.day, this.temperature, this.humidity);
  final String day;
  final double temperature;
  final double humidity;
}
