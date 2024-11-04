import 'package:flutter/material.dart';
import 'package:jamur/homePage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _startSplashScreen();
  }

  _startSplashScreen() async {
    await Future.delayed(Duration(seconds: 2)); 
    setState(() {
      _opacity = 1.0; 
    });
    await Future.delayed(Duration(seconds: 1)); 
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 1), // Durasi animasi
          child: Image.asset('assets/images/logo.png',width: 200,height: 200,), 
        ),
      ),
    );
  }
}
