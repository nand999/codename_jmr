import 'package:flutter/material.dart';
import 'package:jamur/dashboardPage.dart';
import 'package:jamur/dashboardPage2.dart';
import 'package:jamur/notifPage.dart';
import 'package:jamur/pemantauanPage.dart';
import 'package:jamur/settingPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Indeks tab saat ini
  late PageController _pageController; // Kontroler untuk PageView

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); // Inisialisasi PageController
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose PageController saat tidak digunakan
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index); // Pindah ke halaman yang sesuai
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController, // Menggunakan PageController
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index; // Update indeks saat halaman di-slide
          });
        },
        children: const [
          DashboardPage2(),
          PemantauanPage(),
          NotificationPage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed, // Pastikan ini diatur ke 'fixed'
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Pemantauan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue, // Warna item yang dipilih
        unselectedItemColor: Colors.grey, // Warna item yang tidak dipilih
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        backgroundColor: Colors.blue, // Mengubah background navbar menjadi biru
        onTap: _onItemTapped, // Fungsi tap untuk memilih item
      ),
    );
  }
}
