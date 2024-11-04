import 'package:flutter/material.dart';
import 'package:jamur/components/ccccc.dart'; // Pastikan path ini sesuai

class CobaAppbar extends StatefulWidget {
  @override
  _CobaAppbarState createState() => _CobaAppbarState();
}

class _CobaAppbarState extends State<CobaAppbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _topBarAnimation;
  double topBarOpacity = 0.0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _topBarAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: CustomAppBarAnimasi(
          animationController: _animationController,
          topBarAnimation: _topBarAnimation,
          topBarOpacity: topBarOpacity,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Center(
          child: Text('Home Page Content'),
        ),
      ),
    );
  }
}
