import 'package:flutter/material.dart';

class CustomHorizontalCard extends StatelessWidget {
  final String logoPath;
  final String label;
  final bool switchValue;
  final Function(bool) onToggle;

  const CustomHorizontalCard({
    required this.logoPath,
    required this.label,
    required this.switchValue,
    required this.onToggle,
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
                // Label
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // Switch di kanan
            Switch(
              value: switchValue,
              onChanged: onToggle,
            ),
          ],
        ),
      ),
    );
  }
}
