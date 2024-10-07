import 'package:flutter/material.dart';

class CustomButtonCard extends StatelessWidget {
  final String logoPath;
  final String label;
  final VoidCallback onPressed;

  const CustomButtonCard({
    required this.logoPath,
    required this.label,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Logo di kiri
                  Image.asset(
                    logoPath,
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(width: 10),
                  // Label di samping logo
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Ikon tombol di kanan
              // const Icon(
              //   Icons.arrow_forward,
              //   color: Colors.blue,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
