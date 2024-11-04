import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jamur/components/customCard.dart';
import 'package:jamur/components/customCardRounded.dart';
import 'package:jamur/components/customPopup.dart';
import 'package:jamur/config.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DashboardPage2 extends StatefulWidget {
  const DashboardPage2({Key? key}) : super(key: key);
  @override
  _DashboardPage2State createState() => _DashboardPage2State();
}

class _DashboardPage2State extends State<DashboardPage2> {
  List<ChartData> historyChartData = [];

  double topBarOpacity = 0.0;
  double currentTemperature = 00;
  double currentHumidity = 00;
  bool isLampOn = false;
  bool isFanOn = false;
  Timer? timer;

  // void _waterMushroomFarm() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return CustomPopup(
  //         title: 'Penyiraman Berhasil',
  //         content: 'Kumbung jamur telah disiram.',
  //         buttonText: 'OK',
  //         onButtonPressed: () {},
  //       );
  //     },
  //   );
  // }

  Future<void> fetchHistoryData() async {
    final response =
        await http.get(Uri.parse('${Config.apiUrl}/get_riwayat_hari.php'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse['success']) {
        final data = jsonResponse['data'] as List;
        setState(() {
          historyChartData = data.map((item) {
            String dayOnly =
                item['tanggal'].substring(item['tanggal'].length - 2);
            return ChartData(dayOnly, double.parse(item['suhu_average']),
                double.parse(item['kelembapan_average']));
          }).toList();
        });
      }
    } else {
      throw Exception('Failed to load history data');
    }
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('${Config.apiUrl}/get_realtime_data.php'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse['success']) {
        final data = jsonResponse['data'] as List;
        if (data.isNotEmpty) {
          final latestData = data.last;
          setState(() {
            currentTemperature = double.parse(latestData['suhu']);
            currentHumidity = double.parse(latestData['kelembapan']);
          });
        }
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> _refreshData() async {
    await fetchData();
    await fetchHistoryData();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchHistoryData();

    timer = Timer.periodic(const Duration(seconds: 2), (Timer t) => fetchData());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFB2FEFA),
                Color(0xFF0ED2F7),
              ],
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MediterranesnDietView(
                  temperature: currentTemperature,
                  humidity: currentHumidity,
                ),
                DefaultTabController(
                  length: 2,
                  child: CustomCard(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Riwayat rata-rata Suhu dan Kelembapan   (7 Hari Terakhir)',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const TabBar(
                            labelColor: Colors.blue,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: Colors.blue,
                            tabs: [
                              Tab(text: 'Suhu'),
                              Tab(text: 'Kelembapan'),
                            ],
                          ),
                          SizedBox(
                            height: 300, // Tinggi area grafik
                            child: TabBarView(
                              children: [
                                // Tab Suhu
                                SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  legend: const Legend(isVisible: true),
                                  tooltipBehavior:
                                      TooltipBehavior(enable: true),
                                  series: <CartesianSeries<ChartData, String>>[
                                    LineSeries<ChartData, String>(
                                      dataSource: historyChartData,
                                      xValueMapper: (ChartData data, _) =>
                                          data.day,
                                      yValueMapper: (ChartData data, _) =>
                                          data.temperature,
                                      name: 'Suhu (°C)',
                                      dataLabelSettings:
                                          const DataLabelSettings(
                                              isVisible: true),
                                    ),
                                  ],
                                ),
                                // Tab Kelembapan
                                SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  legend: const Legend(isVisible: true),
                                  tooltipBehavior:
                                      TooltipBehavior(enable: true),
                                  series: <CartesianSeries<ChartData, String>>[
                                    LineSeries<ChartData, String>(
                                      dataSource: historyChartData,
                                      xValueMapper: (ChartData data, _) =>
                                          data.day,
                                      yValueMapper: (ChartData data, _) =>
                                          data.humidity,
                                      name: 'Kelembapan (%)',
                                      dataLabelSettings:
                                          const DataLabelSettings(
                                              isVisible: true),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 37),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.day, this.temperature, this.humidity);
  final String day;
  final double temperature;
  final double humidity;
}
