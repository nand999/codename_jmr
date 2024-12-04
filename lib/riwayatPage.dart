import 'package:flutter/material.dart';
import 'package:jamur/components/navbar.dart';
import 'package:jamur/components/customButton.dart';
import 'package:jamur/detailRiwayat.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({Key? key}) : super(key: key);

  @override
  _RiwayatPageState createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  int selectedYear = DateTime.now().year;
  int selectedMonth = DateTime.now().month;

  @override
  Widget build(BuildContext context) {
    List<String> months = [
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember"
    ];

    int daysInMonth(int year, int month) {
      return DateTime(year, month + 1, 0).day;
    }

    List<Widget> generateDayButtons() {
      int totalDays = daysInMonth(selectedYear, selectedMonth);
      return List.generate(totalDays, (index) {
        String dayLabel =
            "${index + 1} ${months[selectedMonth - 1]} $selectedYear";
        String formattedDate =
            "${index + 1}_${selectedMonth}_$selectedYear"; // Format tanggal untuk URL
        return Padding(
          padding: const EdgeInsets.all(10),
          child: CustomButton(
            text: dayLabel,
            onPressed: () {
              // Navigasi ke halaman detail dengan data tanggal
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailRiwayatPage(formattedDate: formattedDate),
                ),
              );
            },
          ),
        );
      });
    }

    return Scaffold(
      appBar: CustomNavbar(
        onLogoutTap: () {},
        titleText: "Riwayat Jamur",
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: ListView(
              children: generateDayButtons(),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<int>(
                  value: selectedMonth,
                  items: List.generate(
                    12,
                    (index) => DropdownMenuItem(
                      value: index + 1,
                      child: Text(months[index]),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedMonth = value!;
                    });
                  },
                ),
                DropdownButton<int>(
                  value: selectedYear,
                  items: List.generate(
                    10,
                    (index) => DropdownMenuItem(
                      value: DateTime.now().year - index,
                      child: Text("${DateTime.now().year - index}"),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedYear = value!;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
