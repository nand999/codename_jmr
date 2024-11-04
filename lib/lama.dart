                // CustomCard(
                //   child: Padding(
                //     padding: const EdgeInsets.all(9.0),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.stretch,
                //       children: [
                //         const Text(
                //           'Kondisi Kumbung Jamur Saat Ini:',
                //           style: TextStyle(
                //             fontSize: 14,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.black,
                //           ),
                //           textAlign: TextAlign.center,
                //         ),
                //         const SizedBox(height: 20),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           children: [
                //             // Kotak untuk Suhu
                //             Container(
                //               width: 110,
                //               padding: const EdgeInsets.all(20.0),
                //               margin: const EdgeInsets.symmetric(horizontal: 5),
                //               decoration: BoxDecoration(
                //                 color: Colors.blue[50],
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //               child: Column(
                //                 children: [
                //                   const Icon(Icons.thermostat,
                //                       size: 50, color: Colors.blue),
                //                   const SizedBox(height: 10),
                //                   const Text(
                //                     'Suhu:',
                //                     style: TextStyle(
                //                       fontSize: 11,
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                     textAlign: TextAlign.center,
                //                   ),
                //                   Text(
                //                     '$currentTemperature°C',
                //                     style: const TextStyle(
                //                       fontSize: 18,
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                     textAlign: TextAlign.center,
                //                   ),
                //                 ],
                //               ),
                //             ),
                //             // Kotak untuk Kelembapan
                //             Container(
                //               width: 110,
                //               padding: const EdgeInsets.all(20.0),
                //               margin: const EdgeInsets.symmetric(horizontal: 5),
                //               decoration: BoxDecoration(
                //                 color: Colors.blue[50],
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //               child: Column(
                //                 children: [
                //                   const Icon(Icons.water_drop,
                //                       size: 50, color: Colors.blue),
                //                   const SizedBox(height: 10),
                //                   const Text(
                //                     'Kelembapan:',
                //                     style: TextStyle(
                //                       fontSize: 11,
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                     textAlign: TextAlign.center,
                //                   ),
                //                   Text(
                //                     '$currentHumidity%',
                //                     style: const TextStyle(
                //                       fontSize: 18,
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                     textAlign: TextAlign.center,
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //         SizedBox(
                //           height: 10,
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 30),
                // CustomButtonCard(
                //   logoPath: 'assets/images/jamur.png',
                //   label: 'Sirami Kumbung Jamur',
                //   onPressed: _waterMushroomFarm,
                // ),
                // const SizedBox(height: 20),
                // // Card Horizontal untuk Lampu
                // Card(
                //   margin: const EdgeInsets.symmetric(vertical: 10),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(15),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(15.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         // Label Lampu
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: const [
                //             Text(
                //               'Lampu',
                //               style: TextStyle(
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //             SizedBox(height: 5),
                //             Text(
                //               'Status: Mati/Hidup',
                //               style: TextStyle(
                //                 fontSize: 16,
                //                 color: Colors.grey,
                //               ),
                //             ),
                //           ],
                //         ),
                //         // Switch Lampu
                //         Switch(
                //           value: isLampOn, // status switch (true/false)
                //           onChanged: (bool value) {
                //             setState(() {
                //               isLampOn = value; // Ganti status switch
                //               // Tambahkan fungsi untuk mengontrol lampu di sini
                //             });
                //           },
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // // Card Horizontal untuk Kipas
                // Card(
                //   margin: const EdgeInsets.symmetric(vertical: 10),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(15),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(15.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         // Label Kipas
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: const [
                //             Text(
                //               'Kipas',
                //               style: TextStyle(
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //             SizedBox(height: 5),
                //             Text(
                //               'Status: Mati/Hidup',
                //               style: TextStyle(
                //                 fontSize: 16,
                //                 color: Colors.grey,
                //               ),
                //             ),
                //           ],
                //         ),
                //         // Switch Kipas
                //         Switch(
                //           value: isFanOn, // status switch (true/false)
                //           onChanged: (bool value) {
                //             setState(() {
                //               isFanOn = value; // Ganti status switch
                //               // Tambahkan fungsi untuk mengontrol kipas di sini
                //             });
                //           },
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // CustomHorizontalCard(
                //   logoPath: 'assets/images/jamur.png',
                //   label: 'Lampu',
                //   switchValue: isLampOn,
                //   onToggle: (value) {
                //     setState(() {
                //       isLampOn = value;
                //     });
                //   },
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // CustomHorizontalCard(
                //   logoPath: 'assets/images/jamur.png',
                //   label: 'Kipas',
                //   switchValue: isFanOn,
                //   onToggle: (value) {
                //     setState(() {
                //       isFanOn = value;
                //     });
                //   },
                // ),