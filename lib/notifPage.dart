import 'package:flutter/material.dart';
import 'package:jamur/components/navbar.dart';
import 'package:jamur/model/notifikasiModel.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationModel> notifications = [
    NotificationModel("Kelembapan diatas normal: 98%", DateTime.now().subtract(Duration(minutes: 5))),
    NotificationModel("Suhu dibawah normal: 10°C", DateTime.now().subtract(Duration(minutes: 10))),
    NotificationModel("Kelembapan dibawah normal: 7%", DateTime.now().subtract(Duration(minutes: 15))),
    NotificationModel("Suhu diatas normal: 32°C", DateTime.now().subtract(Duration(minutes: 20))),
  ];

  Future<void> _refreshNotifications() async {
    // Simulasi refresh data, misalnya bisa memanggil API baru atau mengupdate dari sumber lain
    await Future.delayed(const Duration(seconds: 2)); // Delay untuk simulasi loading

    setState(() {
      // Tambahkan data notifikasi baru atau ubah sesuai kebutuhan
      notifications = [
        NotificationModel("Kelembapan diatas normal: 99%", DateTime.now().subtract(Duration(minutes: 1))),
        NotificationModel("Suhu diatas normal: 34°C", DateTime.now().subtract(Duration(minutes: 2))),
        NotificationModel("Kelembapan normal: 70%", DateTime.now().subtract(Duration(minutes: 3))),
        ...notifications, // Menambahkan notifikasi lama ke list baru
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNavbar(onLogoutTap: (){}, titleText: "Notifikasi",),
      body: RefreshIndicator(
        onRefresh: _refreshNotifications, // Memanggil fungsi refresh
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black26,
                  width: 1.5, // Membuat border yang tipis dan bersih
                ),
              ),
              child: ListTile(
                title: Text(
                  notification.message,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${notification.timestamp.hour}:${notification.timestamp.minute.toString().padLeft(2, '0')}",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
