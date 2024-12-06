import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jamur/components/navbar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jamur/config.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationModel> notifications = [];

  @override
  void initState() {
    super.initState();
    fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    final response =
        await http.get(Uri.parse('${Config.apiUrl}/get_notifications.php'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse['success']) {
        final data = jsonResponse['data'] as List;
        setState(() {
          notifications = data.map((item) {
            return NotificationModel(
              item['title'],
              double.parse(item['suhu']),
              double.parse(item['kelembapan']),
              DateTime.parse(item['waktu']),
            );
          }).toList();
        });
      } else {
        setState(() {
          notifications = [];
        });
      }
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  Future<void> _refreshNotifications() async {
    await fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNavbar(onLogoutTap: () {SystemNavigator.pop();}, titleText: "Notifikasi"),
      body: RefreshIndicator(
          onRefresh: _refreshNotifications,
          child: notifications.isEmpty
              ? Center(child: Text("Tidak ada notifikasi"))
              : ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notification = notifications[index];
                    String additionalInfo = '';

                    if (notification.message.contains('Suhu')) {
                      additionalInfo = '${notification.suhu}°C';
                    } else if (notification.message.contains('Kelembapan')) {
                      additionalInfo = '${notification.kelembapan}%';
                    }

                    bool isToday = notification.timestamp.year == DateTime.now().year &&
                        notification.timestamp.month == DateTime.now().month &&
                        notification.timestamp.day == DateTime.now().day;

                    // Format waktu atau tanggal sesuai kondisi
                    String formattedTime = isToday
                        ? "${notification.timestamp.hour}:${notification.timestamp.minute.toString().padLeft(2, '0')}"
                        : "${notification.timestamp.day}-${notification.timestamp.month}-${notification.timestamp.year} "
                          "${notification.timestamp.hour}:${notification.timestamp.minute.toString().padLeft(2, '0')}";

                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black26,
                          width: 1.5,
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          '${notification.message}: $additionalInfo',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          formattedTime,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    );
                  },
                )),
    );
  }
}

class NotificationModel {
  final String message;
  final double suhu;
  final double kelembapan;
  final DateTime timestamp;

  NotificationModel(this.message, this.suhu, this.kelembapan, this.timestamp);
}
