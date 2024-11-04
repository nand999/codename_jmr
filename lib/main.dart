import 'package:flutter/material.dart';
import 'package:jamur/contohProgess.dart';
import 'package:jamur/percobaanAppbar.dart';
import 'package:jamur/splashScreen.dart';
import 'package:jamur/test.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const DashboardScreen(),
      home: SplashScreen(),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
