import 'package:flutter/material.dart';
import 'package:jamur/fitness_app_theme.dart';
import 'dart:math' as math;

class CobaCard extends StatelessWidget {
  final Widget child; // Atribut child untuk menempatkan konten
  const CobaCard({
    Key? key,
    required this.child, // Meminta konten yang akan dimasukkan
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(0.0, 30 * 1.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 16, bottom: 18),
        child: Container(
          decoration: BoxDecoration(
            color: FitnessAppTheme.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(68.0),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: FitnessAppTheme.grey.withOpacity(0.2),
                offset: Offset(1.1, 1.1),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: child, // Memasukkan konten dinamis ke dalam card
        ),
      ),
    );
  }
}
